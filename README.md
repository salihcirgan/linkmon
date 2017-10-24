# linkmon
Monitoring Fortigate link monitor state. Sample script monitors first link state defined in "jq .source[0].state"
You can parse XML output anyway you want with jq (command-line JSON processor)

Return codes 
0 OK
2 Error
1 something went wrong
