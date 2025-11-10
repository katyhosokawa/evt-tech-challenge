## EVT Technology Challenge 2025

### Prerequisities:
Docker Desktop installed and started
Bash shell (macOS/Linux)
Port 8443 available

### How to Run: 
1. Run `./start.sh`
2. Navigate to: https://localhost:8443

Note: When opening the browser, you may receive a security warning since the webpage is self-signed. In order to bypass this, click "Advanced" and then "Proceed to localhost" to view the page.

### How to stop the server:
1. Run `docker stop evt-webserver`

### Design Decisions
In terms of webservers, I chose NGINX as it can maintain high-performance and efficiency when facing high traffic. While this performance may not be neccessary in this use-case, it will be for a production web server and mostly closely mimics what I might do at EVT. 

I chose to utilize docker to automate the build as Docker is an industry standard for running applications in containers and load balancing. This is important in order to maximize the benefits of NGINX. Docker is a tool that I was curious about, so this seemed like a good oppurtunity to implement it. Furthermore, it is an effective way to run the code across different systems without modification.

For configuration management, I used Bash scripting as it is an easily interpretable way to start up the webserver with a single command. This seemed like a logical choice since I have experience with Bash scripting and have found it to be lightweight, flexible, and relatively simple. With that being said, I acknowledge that it likely wouldnt scale well for large-scale deployments and that I may consider other tools in the future. 