
ivan = {
    "name": "invan",
    "age": 34,
    "children": [
        {
            "name": "vasja",
            "age": "12",
        },
        {
            "name": "petja",
            "age": 10,
        },
    ]
}

darja = {
    "name": "darja",
    "age": 41,
    "children": [
        {
            "name": "kirill",
            "age": 21,
        },
        {
            "name": "pavel",
            "age": 15,
        },
    ]
}


emps = [ivan, darja]

for i in emps:
    for p in i["children"]:
        if int(p["age"]) > 18:
            print(i["name"])
            break;
