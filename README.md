# serversided-auth-login
A simple server sided auth login made for ios modders that uses php and objectivec

# Example Usage php
`I recommend use https://www.000webhost.com/
for now to Upload the APIClient.php and get the url and paste it in APIClient.mm
it could look like this https://website.com/APIClient.php?api=%@ in the .mm file. but it could look a bit different too for which ever site you use there might be a folder so https://website.com/somefolder/APIClient.php if your struggling make a pole issue i will help you
`

# Example Useage objective-c
```obj-c
void testFuncion(){
   //free or paid 
   [APIClient paid:^{
       //load menu in this function 
       menuSetup(); //etc
       loadMenuFunction();
   }];
}
```
