//setup
var patentmessage = 'please connect to get message';
const Send_topic = "r_mngd";
const Receive_topic = "s_mngd";

int isset = 0; //0 not concted, 1 connected,2 reset
int p_state = 0; //0 not unknown ,1 stable ,2 unstable
String last_update = "-";
//varivables
String p_name = "";
String p_room = "";
double p_limit = 100;
