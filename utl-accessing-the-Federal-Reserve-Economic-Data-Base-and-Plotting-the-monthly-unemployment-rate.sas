Accessing the Federal Reserve Economic Data Base and Plotting the unemployment rate                                                     
                                                                                                                                        
github                                                                                                                                  
https://tinyurl.com/y9vgna7w                                                                                                            
https://github.com/rogerjdeangelis/utl-accessing-the-Federal-Reserve-Economic-Data-Base-and-Plotting-the-monthly-unemployment-rate      
                                                                                                                                        
SAS Forum                                                                                                                               
https://tinyurl.com/yd2oud68                                                                                                            
https://communities.sas.com/t5/SAS-Forecasting-and-Econometrics/SASEFRED-use-possible/m-p/648326                                        
                                                                                                                                        
Note that you cannot request or view data without creating an  \account research.stlouisfed.org user account.                           
                                                                                                                                        
create ann account                                                                                                                      
https://fred.stlouisfed.org/docs/api/api_key.html                                                                                       
                                                                                                                                        
getkey                                                                                                                                  
https://fred.stlouisfed.org/docs/api/fred/#API                                                                                          
                                                                                                                                        
Install fred                                                                                                                            
http://sboysel.github.io/fredr/articles/fredr.html                                                                                      
devtools::install_github("sboysel/fredr")                                                                                               
                                                                                                                                        
Packages                                                                                                                                
                                                                                                                                        
Python                                                                                                                                  
avelkoski/FRB            (third-party software, external link)                                                                          
jjotterson/datapungi_fed (third-party software, external link)                                                                          
mortada/fredapi          (third-party software, external link)                                                                          
zachwill/fred            (third-party software, external link)                                                                          
                                                                                                                                        
R                                                                                                                                       
jcizel/FredR       (third-party software, external link)                                                                                
markushhh/FredApi  (third-party software, external link)                                                                                
onnokleen/alfred   (third-party software, external link)                                                                                
sboysel/fredr      (third-party software, external link)  * this seems like the newest with many updates?                               
                                                                                                                                        
*_                   _                                                                                                                  
(_)_ __  _ __  _   _| |_                                                                                                                
| | '_ \| '_ \| | | | __|                                                                                                               
| | | | | |_) | |_| | |_                                                                                                                
|_|_| |_| .__/ \__,_|\__|                                                                                                               
        |_|                                                                                                                             
;                                                                                                                                       
                                                                                                                                        
api_key=abcdefghijklmnopqrstuvwxyz123456  (this key will not work in the code below get a registered key)                               
                                                                                                                                        
*            _               _                                                                                                          
  ___  _   _| |_ _ __  _   _| |_                                                                                                        
 / _ \| | | | __| '_ \| | | | __|                                                                                                       
| (_) | |_| | |_| |_) | |_| | |_                                                                                                        
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                                       
                |_|                                                                                                                     
;                                                                                                                                       
                                                                                                                                        
+***************************************************+                                                                                   
*     Federal Reserve Monthly Unemployment Rate     *                                                                                   
*                                                   *                                                                                   
*   MONTH           Unemployment                    *                                                                                   
*                      Rsate                        *                                                                                   
*            |                                      *                                                                                   
*    MAY19   |#######    3.6                        *                                                                                   
*    JUN19   |#######    3.7                        *                                                                                   
*    JUL19   |#######    3.7                        *                                                                                   
*    AUG19   |#######    3.7                        *                                                                                   
*    SEP19   |#######    3.5                        *                                                                                   
*    OCT19   |#######    3.6                        *                                                                                   
*    NOV19   |#######    3.5                        *                                                                                   
*    DEC19   |#######    3.5                        *                                                                                   
*    JAN20   |#######    3.6                        *                                                                                   
*    FEB20   |#######    3.5                        *                                                                                   
*    MAR20   |#########  4.4                        *                                                                                   
*    APR20   |#############################  14.7   *                                                                                   
*            |   2   4   6   8   10  12  14         *                                                                                   
*                  Unemployment Rate                *                                                                                   
*                                                   *                                                                                   
+***************************************************+                                                                                   
                                                                                                                                        
*                                                                                                                                       
 _ __  _ __ ___   ___ ___  ___ ___                                                                                                      
| '_ \| '__/ _ \ / __/ _ \/ __/ __|                                                                                                     
| |_) | | | (_) | (_|  __/\__ \__ \                                                                                                     
| .__/|_|  \___/ \___\___||___/___/                                                                                                     
|_|                                                                                                                                     
;                                                                                                                                       
                                                                                                                                        
%utl_submit_r64('                                                                                                                       
library(fredr);                                                                                                                         
library(SASxport);                                                                                                                      
fredr_set_key("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");                                                                                      
want<-as.data.frame(fredr_series_observations(                                                                                          
  series_id = "UNRATE",                                                                                                                 
  observation_start = as.Date("2019-05-01"))                                                                                            
);                                                                                                                                      
str(want);                                                                                                                              
write.xport(want,file="d:/xpt/want.xpt");                                                                                               
');                                                                                                                                     
                                                                                                                                        
libname xpt xport "d:/xpt/want.xpt";                                                                                                    
data want;                                                                                                                              
  set xpt.want;                                                                                                                         
run;quit;                                                                                                                               
libname xpt clear;                                                                                                                      
                                                                                                                                        
options ls=64 ps=32;                                                                                                                    
proc chart data=want ;                                                                                                                  
format date monyy5.;                                                                                                                    
hbar date / sumvar=value discrete width=1 space=0;                                                                                      
run;quit;                                                                                                                               
                                                                                                                                        
