/*Компилятор HI-TECH PICC.
 PIC12F683 работает от внутреннего генератора 8 МГц
 Используется аппаратный ШИМ 10 bit.
 При открытии двери плавно зажигается свет.Если дверь закрылась-плавно тухнет через 30 сек,если включили 
 зажигание - тухнет сразу.Если дверь остается открыта-плавно тухнет через 5 мин.При снятии и постановке 
 на охрану - зажигается или тухнет.При вытягивании ключа из замка зажигания,зажигается на 30 сек.
 Если свет потушен ,контроллер засыпает через 5 сек.
 При желании можно включить собаку(в тексте сброс прописан).
*/                        

//**************************Подключение файлов***************************************************************
#include <pic.h> 
#include "podgot12f683.h"
#include "initConst.h"
#include "inputPins.h"
#include "pwm1.h"

//*********************Обьявление переменных************************************************

// 
 struct {                                  //структура  "ДВЕРЬ".
  unsigned char flag;                      //флаг,что дверь открывалась
  unsigned char status;                    //положение двери(откр. или закр.)
  signed long volatile tmrOpen;            //таймер открытой двери
  signed int volatile tmrClose;            //таймер закрытой двери 
}door;

struct{                                    //структура  "КЛЮЧ".
  unsigned char flag;                      //флаг,что ключь был в замке(и был повернут)
  unsigned char in_lock;                   //ключь вставлен в замок
  unsigned char power;                     //ключ повернут
}key;


unsigned char alarm = 0;                  //сигнализация на охране (1),не на охране (0)
unsigned char  flagalarm=0;               // флаг,что ставили на охрану

unsigned char volatile tic=0;            //системные тики
signed int volatile tmrSleep=0;          //таймер перед входом в SLEEP.

unsigned int  pwmduty1 = 0;              // время импульса ШИМ1(скважность).

unsigned char togel=0;                   // переключатель 

bit flagtimer1 =0;                       //флаг таймера
bit flagtimer2=0;                        //-"-
bit flagtimer3=0;                        //-"-

unsigned  int  pwmMax=1023;              //максимальное значение ШИМ 

//****************************************************************************************

//-------------------------функция ухода в SLEEP------------------------------------------
void gotosleep (void){                                 //функция ухода в SLEEP
                                      //если уровень ШИМ нулевой(потушено)
                   
          if(flagtimer3==0){                          //если таймер не запущен(флаг  таймера cnt5  сброшен)....
              tmrSleep = TIME_BEFORE_SLEEP ;          // запускаем таймер       
              flagtimer3=1;                           //устанавливаем флаг таймера
          }

          if(tmrSleep == 0){                          //если таймер отсчитал..
              GPIE =1;                                //разрешаем прерывания по изменению состояния на PORTA
              GPIO1=0;                                //гасим подсветку замка,если ключь не вставлялся в замок
              CCP1CON=0b00000000;                     //выключаем ШИМ перед сном(контрольный в голову )))) ).
              
               asm("sleep");                          // идем спать...
               }
         
}                                                     //end gotosleep
//------------------------функция зажигания салонного света-------------------------------

void lightingled1 (void){                            //функция зажигания салонного света
 
   if (pwmduty1 < pwmMax){                           //если значение ШИМ меньше нужного значения(максимального)
        if( (tic % TIMEUP1) ==0){                    //... то через определенное количество тиков(tic),определяемое константой TIMEUP1...
         pwmduty1++;                                 //...инкриментируем значение ШИМ.
        }
     }
}                                                   //end lightingled1
//------------------------функция гашения салонног света--------------------------------------
void blankingled1 (void){                           //функция гашения салонног света

   if (pwmduty1 !=0){                               //если зажигание выключено ,тушим свет медленно
       if(key.power==0){
       if ((tic % TIMEDOWN1) ==0)pwmduty1--;
       }
       else{
       if((tic % TIMEDOWN11) ==0)pwmduty1--;        //если зажигание включено,тушим свет быстрее
       }
    }  
}                                                   //end blankingled1
//----------------------функция обработки салонного света------------------------------------
void mainled1 (void){                               //функция обработки салонного света
 if(key.power==1 && key.in_lock==1)key.flag=1;      //флаг ,что ключ был вставлен в замок и включалось зажигание
 if(door.status==1)door.flag=0;                     //переброс флага. что бы отреагировать на событие(установка таймера) один раз
 if(alarm==1)flagalarm=1;                           //переброс флага.что бы отреагировать на событие(включение сигнализации) один раз

//-----------------------switch-----------------------

 switch(togel){
      case 0 :                                      //всё потушено,ожидание событий
       
        if(door.status==0 && door.flag==0 && alarm==0){togel=1;}                
        if(alarm==0 && flagalarm ==1 ){flagalarm=0;togel=1;}
        if(key.in_lock==0 && key.flag==1 && key.power==0 && alarm==0 ){key.flag=0;togel=1;} //!!!!!!!была ошибка -флаг
        break;
 
     case 1 :                                       //зажигание света
        lightingled1();
       if(door.status==1 && key.power==1){togel=4;} // если дверь закрылась во время зажигания света и зажигание включено ...
       if(alarm==1){togel=4;}  
       if(pwmduty1==pwmMax){togel=2;}  break;

    case 2 :                                        //зажжено,отсчет времени,ожидание событий
         if(door.status==1){flagtimer1=0;door.flag=0;togel=3;} 
         if(door.status==0){
             flagtimer2=0;
         if(flagtimer1==0){door.tmrOpen = TIME_DOOR_OPEN; flagtimer1=1;}  //  300 000  это 5 минут
         if(door.tmrOpen==0){door.flag=1;togel=4;}  
         if(alarm==1){togel=4;}   
           }
           break;         

    case 3 :                                       //пауза перед тушением
        if(flagtimer2==0){door.tmrClose = TIME_DOOR_CLOSE; flagtimer2=1;}    
        if(door.tmrClose==0){togel=4;}                 
        if(key.power==1)togel=4;
        if(alarm==1){togel=4;}           //????
        if(door.status==0){flagtimer1=0;togel=1;}  break;

    case 4 :                                      //тушим сразу,идем в начало
         flagtimer1=0;
         flagtimer2=0;
        blankingled1();
        
        if(alarm==0 && flagalarm==1  ){flagalarm=0;togel=1;} 
        if(door.status==0 && door.flag ==0 && alarm==0 ){togel=1;}     //    если дверь открылась во время тушения и зажигание включено...
        if(pwmduty1==0  ){flagtimer3=0;togel=0;}  break;

   default: break;      
           
  }                                             // end switch

}                                               // end mainled1 

//************************чуток доработанный switch,нужно тэстить.***************************
/*
switch(togel){
      case 0 :                                      //an? iioooaii,i?eaaiea niauoee
              if(door.status==0 && door.flag==0 && alarm==0){togel=1;}
              if(alarm==0 && flagalarm ==1 && key.power!=1 ){flagalarm=0;togel=1;}
              if(key.in_lock==0 && key.flag==1 && key.power==0 && alarm==0 ){key.flag=0;togel=1;}
              break;

     case 1 :                                       //ca?eaaiea naaoa
              lightingled1();
              if(pwmduty1==pwmMax){togel=2;}
              if(togel!=2){
                if(door.status==1 && key.power==1){togel=4;} // anee aaa?u cae?ueanu ai a?aiy ca?eaaiey naaoa e ca?eaaiea aee??aii ...
                if(alarm!=0){togel=4;}
                }
              break;

    case 2 :                                        //ca??aii,ion?ao a?aiaie,i?eaaiea niauoee
              if(door.status==0){
                  flagtimer2=0;
                  if(flagtimer1==0){door.tmrOpen =-60000;flagtimer1=1;}
                  if(door.tmrOpen==0){door.flag=1;togel=4;}
                  if(alarm==1){togel=4;}
                  }
             // if(togel!=4){                                               //так не работает!!!!
                 if(door.status==1){flagtimer1=0;door.flag=0;togel=3;}
               //   }              
              break;

    case 3 :                                       //iaoca ia?aa oooaieai
              if(flagtimer2==0){door.tmrClose=-10000;flagtimer2=1;}
              if(door.tmrClose==0){togel=4;}
              if(key.power==1)togel=4;
              if(alarm==1){togel=4;}          //????
              if(togel!=4){
                 if (door.status==0){flagtimer1=0;togel=1;}
                 }
        break;
    case 4 :                                      //oooei n?aco,eaai a ia?aei
              blankingled1();
              if(pwmduty1==0  ){flagtimer1=0;flagtimer2=0;togel=0;}
              if(togel!=0){
                if(alarm==0 && flagalarm==1  ){togel=1;}
               if(door.status==0 && door.flag ==0 && alarm==0 ){togel=1;}     //    anee aaa?u ioe?ueanu ai a?aiy oooaiey e ca?eaaiea aee??aii...
              }
              break;
   default:  togel==0; break;                     //

}                                        // end switch
  */                                           

//************************************закомментировано***************************************
 
//-----------------функция обработки прерываний----------------------------------------------

void interrupt tmr0 (void)                 //функция обработки всех прерываний
{
	
    if( GPIF ){                            //если изменение на пинах PORTA - просыпаемся....
       GPIO & 0b11111111;                  // чтение порта !!!!!!!!!!!!!!так нада
       GPIF=0;                             //сброс флага
       GPIE=0;                             //запрещаем прерывания по изменению на пинах PORTA
       flagtimer3=0;                       //сброс флага таймера SLEEP
       CCP1CON = 0b00001100;               // включаем ШИМ после спячки 
           
     }
    
//------------TMR0 не используется,но оставил на перспективу-------------

if (T0IF && T0IE) {                        //если прерывание от TMR0..
        T0IF = 0;                          //...сбрасываем флаг
        
   asm ("clrwdt");                         //сбрасываем собаку
  
}                                          //end TMR0
 
//-------------TMR1(каждую 1mS)-------------------------------------------

if(TMR1IF && TMR1IE) {                     //если прерывание от TMR1...
    TMR1IF=0;
    TMR1H = TMR1_CALC >> 8 ;               //запись значений в старший байт
    TMR1L = TMR1_CALC & 0x00ff;            //запись значений в младший байт
    
    asm ("clrwdt");
 
    if(++tic==255) {                        //255 милисекунд. с этим расчитываю плавность зажигания гашения  при помощи %
       tic=0;
     //  GPIO1=~GPIO1;                      // мигалка для отладки
     }                                         
     
asm ("clrwdt");                             //сбрасываем собаку...                    
 
if(door.tmrOpen <0){door.tmrOpen++;}        //таймер открытой двери
if(door.tmrClose<0){ door.tmrClose++;}      //таймер закрытой двери
if(tmrSleep < 0){ tmrSleep++ ;}             //   

fnInputpins();                              //функция опроса входных пинов
fnPwm1(pwmduty1);                           //функция ШИМ    

}                                           //end TMR1
//----------------------------------------------------------------------
 
}                                          //end interrupts

//*********************Главная функция******************************************************************
void main (void){

fnPodgot();                                //функция инициализации переферии
door.status=1;                             //начальная установка переменной состояния двери
 
while(1){                                  //вечная шарманка )))
	                                
   asm ("clrwdt");                         //сбрасываем собаку...
	                          
   mainled1();                             //функция обработки салонного света

   if(pwmduty1==0 ){
      gotosleep();                         //режим SLEEP
     }

   }                                       //end while
}                                          // end main
//*******************************************************************************************************


