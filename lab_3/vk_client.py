from vk_app import IdFinder, FriendFinder

name = raw_input('screen_name: ')
#name = 'reigning'
vk_user = IdFinder(name)
id = vk_user.execute()
print(id)
friend_finder = FriendFinder(id)
user_friends = friend_finder.execute()
for key in sorted(user_friends):
    print(key + '' + '#'.join('' for x in range(user_friends[key] + 1)))
