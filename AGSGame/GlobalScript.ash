// Main header script - place import definitions and #define names here

int sciencerun = 2; // Run the scientist once per round (start at 2)
int zombierun = 1; // Run the zombies out
int innocentrun = 1; // Run the innocent out a various intervals

int franklocation = 1; // NPC Frank's initial location

short EnvDmg = 0; // Environment damage

bool shoot; // Moving a bullet
bool warned = false; // Get off the garden warning

float bulletspeed; // The speed of the bullet
float bx, by, xd, yd;

// Set Scientist bools
bool powerup = true; bool cleanguts = true; bool hoochies = true; bool murderbot = true; bool crapper = true; bool cocktail = true; bool recliner = true; bool kingcluck = true; bool explodey = true; bool colossocannon = true; bool trebuchet = true; bool arcadegame = true; bool pimphat = true;

// Zombie Health
int Zombie00000Hlth = 0; int Zombie0000Hlth = 0; int Zombie000Hlth = 0; int Zombie00Hlth = 0; int Zombie0Hlth = 0; int Zombie1Hlth = 0; int Zombie2Hlth = 0; int Zombie3Hlth = 0; int Zombie4Hlth = 0; int Zombie5Hlth = 0; int Zombie6Hlth = 0; int Zombie7Hlth = 0; int Zombie8Hlth = 0; int Zombie9Hlth = 0; 
int Zombie10Hlth = 0; int Zombie11Hlth = 0; int Zombie12Hlth = 0; int Zombie13Hlth = 0; int Zombie14Hlth = 0; int Zombie15Hlth = 0; int Zombie16Hlth = 0; int Zombie17Hlth = 0; int Zombie18Hlth = 0; int Zombie19Hlth = 0;
int Zombie20Hlth = 0; int Zombie21Hlth = 0; int Zombie22Hlth = 0; int Zombie23Hlth = 0; int Zombie24Hlth = 0; int Zombie25Hlth = 0; int Zombie26Hlth = 0; int Zombie27Hlth = 0; int Zombie28Hlth = 0; int Zombie29Hlth = 0;
int BossHlth = 0;

export EnvDmg, shoot, bulletspeed;
