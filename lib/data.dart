//setup
var patentmessage = 'please connect to get message';
const Send_topic = "r_mngd123";
const Receive_topic = "s_mngd123";

int isset = 0; //0 not concted, 1 connected,2 reset
bool isconnected = false;

int p_state1 = 0; //0 not unknown ,1 stable ,2 unstable
String last_update1 = "No previous updates....";
//varivables
String p_name1 = "";
String p_room1 = "";
double p_limit1 = 100;

int p_state2 = 0; //0 not unknown ,1 stable ,2 unstable
String last_update2 = "No previous updates....";
//varivables
String p_name2 = "";
String p_room2 = "";
double p_limit2 = 100;

int device1isset = 0;
int device2isset = 0;
