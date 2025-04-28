#!/bin/bash

# Install nginx
sudo apt update -y
sudo apt install nginx curl jq -y
sudo systemctl enable nginx
sudo systemctl start nginx

# Get IP addresses
PRIVATE_IP=$(hostname -I | awk '{print $1}')
PUBLIC_IP=$(curl -s --max-time 2 http://checkip.amazonaws.com)

# Get instance ID (AWS or GCP or fallback)
INSTANCE_ID=$(curl -s --connect-timeout 2 http://169.254.169.254/latest/meta-data/instance-id)
if [ -z "$INSTANCE_ID" ]; then
    INSTANCE_ID=$(curl -s --connect-timeout 2 -H "Metadata-Flavor: Google" http://169.254.169.254/computeMetadata/v1/instance/id)
fi
if [ -z "$INSTANCE_ID" ]; then
    INSTANCE_ID="Unavailable"
fi

# Create index.html
cat <<EOF | sudo tee /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>KnowWithSilence</title>
    <style>
        body {
            margin: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
            color: white;
            text-align: center;
            background-color: #222;
            transition: background-color 2s ease;
        }
        #info {
            background: rgba(0, 0, 0, 0.6);
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 0 10px #000;
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <h1 style="color: #00ffff;">Welcome to KnowWithSilence</h1>
    <p style="font-size: 1.2em; max-width: 80%; color: #ffffffcc;">Games, Learn and Explore modern technologies with real-world hands-on:</p>
    <div style="margin-top: 20px;">
        <span style="color: #FF9900; font-weight: bold;">AWS</span> &nbsp;|&nbsp;
        <span style="color: #007FFF; font-weight: bold;">Azure</span> &nbsp;|&nbsp;
        <span style="color: #34A853; font-weight: bold;">GCP</span> &nbsp;|&nbsp;
        <span style="color: #FF3366; font-weight: bold;">DevOps</span> &nbsp;|&nbsp;
        <span style="color: #9933FF; font-weight: bold;">DevSecOps</span> &nbsp;|&nbsp;
        <span style="color: #00CC99; font-weight: bold;">SRE</span>
    </div>

    <div id="info">
        <p><strong>Public IP:</strong> $PUBLIC_IP</p>
        <p><strong>Private IP:</strong> $PRIVATE_IP</p>
        <p><strong>Instance ID:</strong> $INSTANCE_ID</p>
    </div>

    <script>
        function randomColor() {
            const r = Math.floor(Math.random() * 256);
            const g = Math.floor(Math.random() * 256);
            const b = Math.floor(Math.random() * 256);
            return \`rgb(\${r}, \${g}, \${b})\`;
        }

        setInterval(() => {
            document.body.style.backgroundColor = randomColor();
        }, 2000);
    </script>
</body>
</html>
EOF

echo "✅ Your KnowWithSilence welcome page is ready at http://<your-server-ip>!"
