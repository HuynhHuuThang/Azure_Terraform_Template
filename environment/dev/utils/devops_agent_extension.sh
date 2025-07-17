set -a && source bash.env && set +a

sudo mkdir /myagent 
cd /myagent
sudo wget https://vstsagentpackage.azureedge.net/agent/4.248.0/vsts-agent-linux-x64-4.248.0.tar.gz
sudo tar zxvf ./vsts-agent-linux-x64-4.248.0.tar.gz
sudo chmod -R 777 /myagent
runuser -l adminuser -c '/myagent/config.sh --unattended  --url https://dev.azure.com/HuynhHuuThang0980/ --auth pat --token 9SMipP5UDTyvcMacKfJBioQsrRsSJf2LBU0uORA1pi2mbpRK55RlJQQJ99BAACAAAAAGZ5CJAAASAZDOjEF0 --pool npd_pool'
sudo /myagent/svc.sh install
sudo /myagent/svc.sh start
exit 0
