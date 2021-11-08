/*���� ��������� ������(�����������)*/


#include <pic.h>
#include "inputpins.h"
#include "initConst.h"

//----------------------------------------------------------------
extern char alarm;

extern struct {                 
  unsigned char flag;
  unsigned char status;
  signed long volatile tmrOpen;
  signed int volatile tmrClose;
}door;

extern struct{
  unsigned char flag;
  unsigned char in_lock;
  unsigned char power;
}key;

//--------------------------------------------------------------

static char adAlarm=0;          //���������� ��� ���������� ������������
static char adAlarm2=0;
static char adDoor=0;
static char adDoor2=0;
static char adKeyPower=0;
static char adKeyPower2=0;
static char adKeyInLock=0;
static char adKeyInLock2=0;    

static char doorOpen=0;         //�������� ����� ��� (-).
static char doorClose=1;        //�������� ����� ��� (+).
static char alarmOn=0;          //������������ �� ������ ����(-).
static char alarmOff=1;         //������������ �� �� ������ ����(+).
static char keyPowerOn=1;
static char keyPowerOff=0;
static char keyInLockOn=1;      //���� � ����� ���� (+).
static char keyInLockOff=0;     //���� �� � ����� ����(-).

//---------------------------------------------------------------

 void fnInputpins (void){

if(PIN_DOOR_STATUS==doorOpen){                 //����������� DOOR_STATUS!!!
   adDoor++;
   if(adDoor>100){door.status=0;adDoor=0;}     //����� �������...
}
else adDoor=0;  

if(PIN_DOOR_STATUS==doorClose){
   adDoor2++;
   if(adDoor2>100){door.status=1;adDoor2=0;}
}
else adDoor2=0;
//---------------------------------------------------

if(PIN_ALARM ==alarmOn){adAlarm++;                 //����������� ALARM!!!
 if(adAlarm>100){alarm =1;adAlarm=0;}
}
else adAlarm=0;

if( PIN_ALARM ==alarmOff ){adAlarm2++;
 if(adAlarm2>100){alarm = 0;adAlarm2=0;}
}
else adAlarm2=0; 
//----------------------------------------------------

if(PIN_KEY_POWER ==keyPowerOff){adKeyPower++;                 //����������� KEY_POWER!!!
 if(adKeyPower>100){key.power =0;adKeyPower=0;}
}
else adKeyPower=0;

if( PIN_KEY_POWER ==keyPowerOn ){adKeyPower2++;
 if(adKeyPower2>100){key.power = 1;adKeyPower2=0;}
}
else adKeyPower2=0; 
//----------------------------------------------------

if(PIN_KEY_IN_LOCK ==keyInLockOff){adKeyInLock++;                 //����������� KEY_IN_LOCK!!!
 if(adKeyInLock>100){key.in_lock =0;adKeyInLock=0;}
}
else adKeyInLock=0;

if( PIN_KEY_IN_LOCK ==keyInLockOn ){adKeyInLock2++;
 if(adKeyInLock2>100){key.in_lock = 1;adKeyInLock2=0;}
}
else adKeyInLock2=0; 

}

//----------------------------------------------------
