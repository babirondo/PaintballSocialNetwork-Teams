#!/bin/bash
pg_dump -h 172.18.0.7 -U postgres  times > /var/www/html/PaintballSocialNetwork-Teams/dump/$(date +"%Y%m%d").sql
