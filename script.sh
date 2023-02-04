#!/bin/bash
echo "Build for web with custom base href"
flutter build web --release --base-href /

echo "Create robots.txt"
echo "User-Agent: *
Allow: /$
Disallow: /" > build/web/robots.txt

echo "Build data.json"
cd data/buildDataJson
npm run export:json
