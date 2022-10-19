import os
import sys
from httpcore import NetworkError
import nmap

network = nmap.PortScanner()
network.scan("127.0.0.1")
print(network['127.0.0.1'].all_protocols())