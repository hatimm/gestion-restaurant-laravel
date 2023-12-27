<?php

namespace App\Http\Controllers;

use App\Servants;
use Illuminate\Http\Request;

class ServantsController extends Controller
{
    // public function __construct()
    // {
    //     $this->middleware('auth');
    // }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('managments.serveurs.index')->with([
            'serveurs' => Servants::paginate(5)
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('managments.serveurs.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //validation
        $this->validate($request,[
            'name' => 'required|min:3'
        ]);
        //store data
        $name = $request->name;
        Servants::create([
            'name' => $request->name,
            'adresse' => $request->adresse,
            'phone' => $request->phone
        ]);
        //redirection
        return redirect()->route('serveurs.index')->with([
            'success' => 'Serveur ajouter avec succés'
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Servants  $servants
     * @return \Illuminate\Http\Response
     */
    public function show(Servants $servants)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Servants  $servants
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        return view('managments.serveurs.edit')->with([
            'serveur' => Servants::findOrFail($id)
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Servants  $servants
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$id)
    {
        //validation
        $this->validate($request,[
            'name' => 'required|min:3'
        ]);
        //store data
        $name = $request->name;
        $servants = Servants::findOrFail($id);
        $servants->update([
            'name' => $request->name,
            'adresse' => $request->adresse,
            'phone' => $request->phone
        ]);
        //redirection
        return redirect()->route('serveurs.index')->with([
            'success' => 'Serveur modifier avec succés'
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Servants  $servants
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $servants = Servants::findOrFail($id);
        $servants->delete();
        //redirection
        return redirect()->route('serveurs.index')->with([
            'success' => 'serveur supprimer avec succés'
        ]);
    }
}
