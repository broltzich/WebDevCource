from django.shortcuts import render
from django.http import HttpResponse
from django.views import View

# Create your views here.

data = {
            'games': [
                {'id': 1, 'title': 'Fallout 2', 'developer': 'Black Isle Studios'},
                {'id': 2, 'title': 'Diablo II', 'developer': 'Blizzard Entertainment'},
                {'id': 3, 'title': 'HOMM III', 'developer': 'New World Computing'},
                {'id': 4, 'title': 'Sunless Sea', 'developer': 'Failbetter Games'}
            ]
}

def index(request):
    return HttpResponse('Hello')

def function_view(request):
    return HttpResponse('response from function view')


class ExampleClassBased(View):
    def get(self, request):
        return HttpResponse('Response from class based view')


class GamesView(View):
    def get(self, request):
        return render(request, 'gameList.html', data)


class GameView(View):

    def get(self, request, game_id):
        select = None
        for game in data['games']:
            if int(game_id) == game['id']:
                select = game
        return render(request, 'gamePage.html', select)



