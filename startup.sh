cd /app/ClientApp
if [ ! -d "node_modules" ];
then
    echo "Instaling angular dependencies"
    npm i
    echo "Dependencies installed"    
fi
npm run dev & cd /app && dotnet watch run --urls https://+:5000
#cd /app
#dotnet watch run --urls https://+:5000