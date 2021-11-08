/*���������� HI-TECH PICC.
 PIC12F683 �������� �� ����������� ���������� 8 ���
 ������������ ���������� ��� 10 bit.
 ��� �������� ����� ������ ���������� ����.���� ����� ���������-������ ������ ����� 30 ���,���� �������� 
 ��������� - ������ �����.���� ����� �������� �������-������ ������ ����� 5 ���.��� ������ � ���������� 
 �� ������ - ���������� ��� ������.��� ����������� ����� �� ����� ���������,���������� �� 30 ���.
 ���� ���� ������� ,���������� �������� ����� 5 ���.
 ��� ������� ����� �������� ������(� ������ ����� ��������).
*/                        

//**************************����������� ������***************************************************************
#include <pic.h> 
#include "podgot12f683.h"
#include "initConst.h"
#include "inputPins.h"
#include "pwm1.h"

//*********************���������� ����������************************************************

// 
 struct {                                  //���������  "�����".
  unsigned char flag;                      //����,��� ����� �����������
  unsigned char status;                    //��������� �����(����. ��� ����.)
  signed long volatile tmrOpen;            //������ �������� �����
  signed int volatile tmrClose;            //������ �������� ����� 
}door;

struct{                                    //���������  "����".
  unsigned char flag;                      //����,��� ����� ��� � �����(� ��� ��������)
  unsigned char in_lock;                   //����� �������� � �����
  unsigned char power;                     //���� ��������
}key;


unsigned char alarm = 0;                  //������������ �� ������ (1),�� �� ������ (0)
unsigned char  flagalarm=0;               // ����,��� ������� �� ������

unsigned char volatile tic=0;            //��������� ����
signed int volatile tmrSleep=0;          //������ ����� ������ � SLEEP.

unsigned int  pwmduty1 = 0;              // ����� �������� ���1(����������).

unsigned char togel=0;                   // ������������� 

bit flagtimer1 =0;                       //���� �������
bit flagtimer2=0;                        //-"-
bit flagtimer3=0;                        //-"-

unsigned  int  pwmMax=1023;              //������������ �������� ��� 

//****************************************************************************************

//-------------------------������� ����� � SLEEP------------------------------------------
void gotosleep (void){                                 //������� ����� � SLEEP
                                      //���� ������� ��� �������(��������)
                   
          if(flagtimer3==0){                          //���� ������ �� �������(����  ������� cnt5  �������)....
              tmrSleep = TIME_BEFORE_SLEEP ;          // ��������� ������       
              flagtimer3=1;                           //������������� ���� �������
          }

          if(tmrSleep == 0){                          //���� ������ ��������..
              GPIE =1;                                //��������� ���������� �� ��������� ��������� �� PORTA
              GPIO1=0;                                //����� ��������� �����,���� ����� �� ���������� � �����
              CCP1CON=0b00000000;                     //��������� ��� ����� ����(����������� � ������ )))) ).
              
               asm("sleep");                          // ���� �����...
               }
         
}                                                     //end gotosleep
//------------------------������� ��������� ��������� �����-------------------------------

void lightingled1 (void){                            //������� ��������� ��������� �����
 
   if (pwmduty1 < pwmMax){                           //���� �������� ��� ������ ������� ��������(�������������)
        if( (tic % TIMEUP1) ==0){                    //... �� ����� ������������ ���������� �����(tic),������������ ���������� TIMEUP1...
         pwmduty1++;                                 //...�������������� �������� ���.
        }
     }
}                                                   //end lightingled1
//------------------------������� ������� �������� �����--------------------------------------
void blankingled1 (void){                           //������� ������� �������� �����

   if (pwmduty1 !=0){                               //���� ��������� ��������� ,����� ���� ��������
       if(key.power==0){
       if ((tic % TIMEDOWN1) ==0)pwmduty1--;
       }
       else{
       if((tic % TIMEDOWN11) ==0)pwmduty1--;        //���� ��������� ��������,����� ���� �������
       }
    }  
}                                                   //end blankingled1
//----------------------������� ��������� ��������� �����------------------------------------
void mainled1 (void){                               //������� ��������� ��������� �����
 if(key.power==1 && key.in_lock==1)key.flag=1;      //���� ,��� ���� ��� �������� � ����� � ���������� ���������
 if(door.status==1)door.flag=0;                     //�������� �����. ��� �� ������������� �� �������(��������� �������) ���� ���
 if(alarm==1)flagalarm=1;                           //�������� �����.��� �� ������������� �� �������(��������� ������������) ���� ���

//-----------------------switch-----------------------

 switch(togel){
      case 0 :                                      //�� ��������,�������� �������
       
        if(door.status==0 && door.flag==0 && alarm==0){togel=1;}                
        if(alarm==0 && flagalarm ==1 ){flagalarm=0;togel=1;}
        if(key.in_lock==0 && key.flag==1 && key.power==0 && alarm==0 ){key.flag=0;togel=1;} //!!!!!!!���� ������ -����
        break;
 
     case 1 :                                       //��������� �����
        lightingled1();
       if(door.status==1 && key.power==1){togel=4;} // ���� ����� ��������� �� ����� ��������� ����� � ��������� �������� ...
       if(alarm==1){togel=4;}  
       if(pwmduty1==pwmMax){togel=2;}  break;

    case 2 :                                        //�������,������ �������,�������� �������
         if(door.status==1){flagtimer1=0;door.flag=0;togel=3;} 
         if(door.status==0){
             flagtimer2=0;
         if(flagtimer1==0){door.tmrOpen = TIME_DOOR_OPEN; flagtimer1=1;}  //  300 000  ��� 5 �����
         if(door.tmrOpen==0){door.flag=1;togel=4;}  
         if(alarm==1){togel=4;}   
           }
           break;         

    case 3 :                                       //����� ����� ��������
        if(flagtimer2==0){door.tmrClose = TIME_DOOR_CLOSE; flagtimer2=1;}    
        if(door.tmrClose==0){togel=4;}                 
        if(key.power==1)togel=4;
        if(alarm==1){togel=4;}           //????
        if(door.status==0){flagtimer1=0;togel=1;}  break;

    case 4 :                                      //����� �����,���� � ������
         flagtimer1=0;
         flagtimer2=0;
        blankingled1();
        
        if(alarm==0 && flagalarm==1  ){flagalarm=0;togel=1;} 
        if(door.status==0 && door.flag ==0 && alarm==0 ){togel=1;}     //    ���� ����� ��������� �� ����� ������� � ��������� ��������...
        if(pwmduty1==0  ){flagtimer3=0;togel=0;}  break;

   default: break;      
           
  }                                             // end switch

}                                               // end mainled1 

//************************����� ������������ switch,����� �������.***************************
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
             // if(togel!=4){                                               //��� �� ��������!!!!
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

//************************************����������������***************************************
 
//-----------------������� ��������� ����������----------------------------------------------

void interrupt tmr0 (void)                 //������� ��������� ���� ����������
{
	
    if( GPIF ){                            //���� ��������� �� ����� PORTA - �����������....
       GPIO & 0b11111111;                  // ������ ����� !!!!!!!!!!!!!!��� ����
       GPIF=0;                             //����� �����
       GPIE=0;                             //��������� ���������� �� ��������� �� ����� PORTA
       flagtimer3=0;                       //����� ����� ������� SLEEP
       CCP1CON = 0b00001100;               // �������� ��� ����� ������ 
           
     }
    
//------------TMR0 �� ������������,�� ������� �� �����������-------------

if (T0IF && T0IE) {                        //���� ���������� �� TMR0..
        T0IF = 0;                          //...���������� ����
        
   asm ("clrwdt");                         //���������� ������
  
}                                          //end TMR0
 
//-------------TMR1(������ 1mS)-------------------------------------------

if(TMR1IF && TMR1IE) {                     //���� ���������� �� TMR1...
    TMR1IF=0;
    TMR1H = TMR1_CALC >> 8 ;               //������ �������� � ������� ����
    TMR1L = TMR1_CALC & 0x00ff;            //������ �������� � ������� ����
    
    asm ("clrwdt");
 
    if(++tic==255) {                        //255 ����������. � ���� ���������� ��������� ��������� �������  ��� ������ %
       tic=0;
     //  GPIO1=~GPIO1;                      // ������� ��� �������
     }                                         
     
asm ("clrwdt");                             //���������� ������...                    
 
if(door.tmrOpen <0){door.tmrOpen++;}        //������ �������� �����
if(door.tmrClose<0){ door.tmrClose++;}      //������ �������� �����
if(tmrSleep < 0){ tmrSleep++ ;}             //   

fnInputpins();                              //������� ������ ������� �����
fnPwm1(pwmduty1);                           //������� ���    

}                                           //end TMR1
//----------------------------------------------------------------------
 
}                                          //end interrupts

//*********************������� �������******************************************************************
void main (void){

fnPodgot();                                //������� ������������� ���������
door.status=1;                             //��������� ��������� ���������� ��������� �����
 
while(1){                                  //������ �������� )))
	                                
   asm ("clrwdt");                         //���������� ������...
	                          
   mainled1();                             //������� ��������� ��������� �����

   if(pwmduty1==0 ){
      gotosleep();                         //����� SLEEP
     }

   }                                       //end while
}                                          // end main
//*******************************************************************************************************


