sudo systemctl status nginx
sudo nginx -t
sudo systemctl reload nginx


sudo nano /etc/nginx/sites-available/gallusgarten.de.conf

sudo mkdir -p /var/www/gallusgarten.de
sudo chown -R www-data:www-data /var/www/gallusgarten.de
sudo chmod -R 755 /var/www/gallusgarten.de


# sudo apt install certbot python3-certbot-nginx

# sudo certbot --nginx -d gallusgarten.de -d www.gallusgarten.de
# sudo certbot --nginx -d couchdb.seointro.de -d www.couchdb.seointro.de
# sudo certbot --nginx -d api.gallusgarten.de -d www.api.gallusgarten.de

# sudo systemctl status certbot.timer
# sudo certbot renew --dry-run


Deploying certificate
Successfully deployed certificate for gallusgarten.de to /etc/nginx/sites-enabled/default
Successfully deployed certificate for www.gallusgarten.de to /etc/nginx/sites-enabled/default
Congratulations! You have successfully enabled HTTPS on https://gallusgarten.de and https://www.gallusgarten.de

sudo ln -s /etc/nginx/sites-available/gallusgarten.de.conf \
           /etc/nginx/sites-enabled/

sudo rm /etc/nginx/sites-enabled/default
sudo nginx -t
sudo systemctl reload nginx


sudo nano /var/www/gallusgarten.de/index.html
Ctrl + K is delete in nano but first select

<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <title>GallusGarten – Wartungsarbeiten</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* Grundlegendes Styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #f0f4f8, #d9e2ec);
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Box Styling */
        .box {
            background: #ffffff;
            padding: 40px 30px;
            max-width: 600px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .box:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
        }

        /* Überschrift */
        h1 {
            margin-bottom: 20px;
            font-size: 28px;
            color: #2c3e50;
        }

        /* Absätze */
        p {
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 15px;
            color: #4a4a4a;
        }

        p strong {
            color: #e74c3c;
        }

        /* Footer-Hinweis (optional) */
        .footer {
            margin-top: 20px;
            font-size: 14px;
            color: #888;
        }
    </style>
</head>
<body>
    <div class="box">
        <h1>Liebe BesucherInnen,</h1>

        <p>
            Gestern gab es einen weltweiten Angriff auf Server.
            Die Störung trifft auch unseren Server <strong>GallusGarten.de</strong>.
        </p>

        <p>
            Die Täter sind BitCoin-Miner. Nun brauchen wir mindestens zwei Tage, 
            um unsere Homepage <strong>GallusGarten.de</strong> wieder neu aufzustellen.
        </p>

        <p>
            Wir bitten um Ihr Verständnis!
        </p>

        <div class="footer">
            &copy; 2025 GallusGarten
        </div>
    </div>
</body>
</html>



