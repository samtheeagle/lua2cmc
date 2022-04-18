# lua2cmc
Parses DCS module keybinds to create more human readable text files.

This script was originally written to generate CMC files for the CH Control Manager application, but it is still of use to anyone else using DCS. It parses the lua config files that define the keyboard binds for a module and outputs them to a simple name keybind pair in a text document, for example:

/////////////////////////////////////     
// Cheat                                                                 
/////////////////////////////////////     
Active_Pause                                                      HOLD LSHF LWIN PAUSE     
Auto_Start                                                        HOLD LWIN KBHOME     
Auto_Stop                                                         HOLD LWIN KBEND      
Recorder_Off                                                      HOLD LALT LSHF r     
Recorder_On                                                       HOLD LWIN LSHF r     

Even though I have upgraded the sensors and circuitboards in my CH gear, and so no longer use CH Control Manager, I still find these generated files invaluable when setting up Joystick Gremlin for a module.

Simply place the scripts and the batch file into the root of your DCS install folder, and then edit the batch file to suit your personal setup. Hopefully the batch file and indeed the script is suitable well commented to help you tweak away.
