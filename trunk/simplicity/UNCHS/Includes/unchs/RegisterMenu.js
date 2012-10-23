// JavaScript Document



function menuUp1(menuId){
switch(menuId)
{
 case 'menuitem11':
 document.getElementById('menuitem22').className='schedule';
 document.getElementById('menuitem33').className='checkout';
 document.getElementById('menuitem44').className='userbilling';
 document.getElementById('menuitem55').className='verification';
 document.getElementById(menuId).className='selectcontainerselected';

 break;
  case 'menuitem22':
 document.getElementById('menuitem11').className='selectcontainer';
 document.getElementById('menuitem33').className='checkout';
 document.getElementById('menuitem44').className='userbilling';
 document.getElementById('menuitem55').className='verification';
 document.getElementById(menuId).className='scheduleselected';

 break;
  case 'menuitem33':
  
 document.getElementById('menuitem22').className='schedule';
 document.getElementById('menuitem11').className='selectcontainer';
 document.getElementById('menuitem44').className='userbilling';
 document.getElementById('menuitem55').className='verification';
 document.getElementById(menuId).className='checkoutselected';
 break;
  case 'menuitem44':
  
 document.getElementById('menuitem22').className='schedule';
 document.getElementById('menuitem33').className='checkout';
 document.getElementById('menuitem11').className='selectcontainer';
 document.getElementById('menuitem55').className='verification';
 document.getElementById(menuId).className='userbillingselected';
 break;
  case 'menuitem55':

 document.getElementById('menuitem22').className='schedule';
 document.getElementById('menuitem33').className='checkout';
 document.getElementById('menuitem44').className='userbilling';
 document.getElementById('menuitem11').className='selectcontainer';
 document.getElementById(menuId).className='verificationselected';
 break;
}

}


function changeCSS1(menuId)
{

switch(menuId)
{
 case 'menuitem11':
 document.getElementById('menuitem22').className='schedule';
 document.getElementById('menuitem33').className='checkout';
 document.getElementById('menuitem44').className='userbilling';
 document.getElementById('menuitem55').className='verification';
 document.getElementById(menuId).className='selectcontainerselected';

 break;
  case 'menuitem22':
 document.getElementById('menuitem11').className='selectcontainer';
 document.getElementById('menuitem33').className='checkout';
 document.getElementById('menuitem44').className='userbilling';
 document.getElementById('menuitem55').className='verification';
 document.getElementById(menuId).className='scheduleselected';

 break;
  case 'menuitem33':
  
 document.getElementById('menuitem22').className='schedule';
 document.getElementById('menuitem11').className='selectcontainer';
 document.getElementById('menuitem44').className='userbilling';
 document.getElementById('menuitem55').className='verification';
 document.getElementById(menuId).className='checkoutselected';
 break;
  case 'menuitem44':
  
 document.getElementById('menuitem22').className='schedule';
 document.getElementById('menuitem33').className='checkout';
 document.getElementById('menuitem11').className='selectcontainer';
 document.getElementById('menuitem55').className='verification';
 document.getElementById(menuId).className='userbillingselected';
 break;
  case 'menuitem55':

 document.getElementById('menuitem22').className='schedule';
 document.getElementById('menuitem33').className='checkout';
 document.getElementById('menuitem44').className='userbilling';
 document.getElementById('menuitem11').className='selectcontainer';
 document.getElementById(menuId).className='verificationselected';
 break;
}
}




function test(menuId){

 var classwidth = new Array(6);
 var classimgurl = new Array(6);
 var classimgpos0 = 0;
 var classimgpos1 = 44; 

classwidth[0]="78";
classwidth[0]="117";
classwidth[0]="80";
classwidth[0]="78";
classwidth[0]="78";
classwidth[0]="78";

classimgurl[0]="homebtn.png";
classimgurl[0]="dumpsterbtn.png";
classimgurl[0]="trackorderbtn.png";
classimgurl[0]="aboutbtn.png";
classimgurl[0]="faqbtn.png";
classimgurl[0]="contactbtn.png";



for (i=1; i<=6; i++){
	 
	 var mnuitem_name = 'menuitem'+i;
	 if (mnuitem_neam == menuId){
		 
		 }
	 document.getElementById(mnuitem_name).className='dumpsterservice';
	}
}