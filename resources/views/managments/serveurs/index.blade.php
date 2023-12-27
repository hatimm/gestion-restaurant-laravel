@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4">
                                @include('layouts.sidebar')
                            </div>
                            <div class="col-md-8">
                                <div class="d-flex flex-row justify-content-between align-items-center border-bottom pb-1">
                                    <h3 class="text-secondary">
                                        <i class="fas fa-user-cog"></i> Sérveurs
                                    </h3>
                                    <a href="{{ route('serveurs.create') }}" class="btn btn-primary">
                                        <i class="fas fa-plus fa-x2"></i>
                                    </a>
                                </div>
                                <table class="table table-hover table-responsive-sm">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Nom</th>
                                            <th>Adresse</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($serveurs as $serveur)
                                        <tr>
                                            <td>{{$serveur->id}}</td>
                                            <td>{{$serveur->name}}</td>
                                            <td>
                                                @if($serveur->adresse)
                                                    {{$serveur->adresse}}
                                                @else
                                                    <span class="text-danger">
                                                        Non disponible
                                                    </span>
                                                @endif
                                            </td>
                                            <td class="d-flex flex-row align-items-center">
                                                <a href="{{ route('serveurs.edit',$serveur->id) }}" class="btn btn-warning mr-1">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <form id="{{$serveur->id}}" action="{{route('serveurs.destroy',$serveur->id)}}" method="post">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button class="btn btn-danger" onclick="event.preventDefault();
                                                    if(confirm('voulez vous supprimer le serveur {{$serveur->name}} '))
                                                    document.getElementById({{$serveur->id}}).submit();">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                                <div class="my-3 d-flex justify-content-center align-items-center">
                                    {{$serveurs->links()}}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection