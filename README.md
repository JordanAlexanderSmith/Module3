# Module3
Creative Embedded Systems Module 3 

For Module3 we were tasked to create a wirelessly embedded system with the added caveat of creating our own DIY sensor. To handle the DIY sensor portion I created a graphite touch sensor. I attached a paperclip to a piece of paper that I wrote the word "Scribble" on with my mechanical pencil. I then soldered a wire onto the paperclip and attached that wire to an analog input on the ESP32. The result is a sensor that when touched produces values greater than 1, and produces zero when at rest. I used this input to trigger the pencil scribble sound byte that I found online.

We were tasked to build off of Module2 in some capacity, so I kept my snare drum button on the top and attached it to a digital pin on the esp32. For my last sensor I wanted to create a bass drum. I attached the vibration sensor to the inside of the box as the sensor itself is very hot. I again used the analog pin on the esp32 and the condition that when they microprocessor sees a values that is greater than one then triggers supercollider to make the sound of a bass drum.

For the wireless component I have the esp32 and Arduino sending udp packets for each of the different sensors to SuperCollider. On SuperCollider I open each of the three ports individually and interperet values that way.

In order to re-create my work one would need a button, a vibration sensor, a paperclip, pencil and paper, an ESP32, and access to the neccesary software being the Arduino IDE and SuperCollider.
