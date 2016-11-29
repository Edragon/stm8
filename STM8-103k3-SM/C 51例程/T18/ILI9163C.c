void    main_init()
{
          write_cmd(0x01);
	delay(100);//delay 100ms
       write_cmd(0x11);  //Exit Sleep   
        delay(100);
 
       write_cmd(0x3A);  //Set Interface Pixel
	write_index(0x66);//18bit RGB IF    
	delay(100);
        write_cmd(0x26);    //Set Default Gamma
        write_index(0x04);
  
        write_cmd(0xf2);     //E0h & E1h Enable/Disable
        write_index(0x01);
        write_cmd(0xE0);    
        write_index(0x3F);
        write_index(0x25);
        write_index(0x1C);
        write_index(0x1E);
        write_index(0x20);
        write_index(0x12);
write_index(0x2A);
        write_index(0x90);
        write_index(0x24);
        write_index(0x11);
write_index(0x00);
        write_index(0x00);
        write_index(0x00);
        write_index(0x00);
write_index(0x00);
        
        write_cmd(0xE1);    //Negative Gamma Setting
        write_index(0x20);
    write_index(0x20);
        write_index(0x20);
        write_index(0x20);
        write_index(0x05);
        write_index(0x00);
        write_index(0x15);
        write_index(0xA7);
        write_index(0x3D);
        write_index(0x18);
        write_index(0x25);
        write_index(0x2A);
        write_index(0x2B);
        write_index(0x2B);
write_index(0x3A);
        
        
 
        write_cmd(0xB1);   
        write_index(0x08);//08
         write_index(0x08);//14
        write_cmd(0xc0);     //Set VRH1[4:0] & VC[2:0] for VCI1 & GVDD
         write_index(0x14); //0A 
        write_index(0x02);
        write_cmd(0xC1);    //Set BT[2:0] for AVDD & VCL & VGH & VGL
        write_index(0x02);
      
        write_cmd(0xC5);     //Set VMH[6:0] & VML[6:0] for VOMH & VCOML
        write_index(0x1d);   //1a
        write_index(0x4a);  //4a
        write_cmd(0xC7);     //Set VMH[6:0] & VML[6:0] for VOMH & VCOML
        write_index(0xCa);   //d0   modify the fliker
  
        write_cmd(0x2A);     //Set Column Address
        write_index(0x00);
        write_index(0x00);
        write_index(0x00);
        write_index(0x7F);
        write_cmd(0x2B);     //Set Page Address
        write_index(0x00);
        write_index(0x00);
        write_index(0x00);
        write_index(0x9F);
        write_cmd(0xEC);   
        write_index(0x0C);
        write_cmd(0x36);   //Set Scanning Direction
        write_index(0xC8);
        write_cmd(0x29);   // Display On   
        write_cmd(0x2c);  //WRITE ram Data display 
     delay(100);
}
