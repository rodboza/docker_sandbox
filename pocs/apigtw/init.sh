alias http='docker exec -it httpie http '

http post kong:8001/apis/ name=Task upstream_url=http://apigtw_web_1:3000/tasks uris=/tasks

http post kong:8000/tasks name=teste1 Created_date=01-01-2018 status=pending
http post kong:8000/tasks name=teste2 Created_date=01-01-2018 status=pending
http post kong:8000/tasks name=teste3 Created_date=01-01-2018 status=pending
http post kong:8000/tasks name=teste4 Created_date=01-01-2018 status=pending
http post kong:8000/tasks name=teste5 Created_date=01-01-2018 status=pending
http post kong:8000/tasks name=teste6 Created_date=01-01-2018 status=pending
http post kong:8000/tasks name=teste7 Created_date=01-01-2018 status=pending
http post kong:8000/tasks name=teste8 Created_date=01-01-2018 status=pending
http post kong:8000/tasks name=teste9 Created_date=01-01-2018 status=pending


