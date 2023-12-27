<?php

namespace App\Http\Controllers;

use App\Category;
use App\Menu;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

class MenuController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('managments.menus.index')->with([
            'menus' =>  Menu::paginate(5)
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('managments.menus.create')->with([
            'categories' =>  Category::all()
        ]);
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
            'title' => 'required|min:3|unique:menus,title',
            'description' => 'required|min:5',
            'image' => 'required|image|mimes:png,jpg,jpeg|max:2048',
            'price' => 'required|numeric',
            'category_id' => 'required|numeric'
        ]);
        //store data
        if($request->hasFile('image')){
            $file = $request->image;
            $imagename = time()."_".$file->getClientOriginalName();
            $file->move(public_path('images/menus'),$imagename);
            $title = $request->title;
            Menu::create([
                'title' => $title,
                'slug' => Str::slug($title),
                'description' => $request->description,
                'price' => $request->price,
                'category_id' => $request->category_id,
                'image' => $imagename,
            ]);
            //redirection
            return redirect()->route('menus.index')->with([
                'success' => 'menu ajouter avec succés'
            ]);
        }
        
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Menu  $menu
     * @return \Illuminate\Http\Response
     */
    public function show(Menu $menu)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Menu  $menu
     * @return \Illuminate\Http\Response
     */
    public function edit(Menu $menu)
    {
        return view('managments.menus.edit')->with([
            'category' => Category::all(),
            'menu' => $menu
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Menu  $menu
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Menu $menu)
    {
        //validation
        $this->validate($request,[
            'title' => 'required|min:3|unique:menus,title,'.$menu->id,
            'description' => 'required|min:5',
            'price' => 'required|numeric',
            'category_id' => 'required'
        ]);
        
        //store data
        if($request->hasFile("image")){
            unlink(public_path('images/menus/'.$menu->image));
            $file = $request->image;
            $imagename = time() . "_" . $file->getClientOriginalName();
            $file->move(public_path('images/menus'),$imagename);
            $title = $request->title;
            
            Menu::create([
                'title' => $title,
                'slug' => Str::slug($title),
                'description' => $request->description,
                'price' => $request->price,
                'category_id' => $request->category_id,
                'image' => $imagename,
            ]);
            //redirection
            return redirect()->route('menus.index')->with([
                'success' => 'menu modifier avec succés'
            ]);
        }else{
            $title = $request->title;
            $menu->update([
                'title' => $title,
                'slug' => Str::slug($title),
                'description' => $request->description,
                'price' => $request->price,
                'category_id' => $request->category_id
            ]);
            //redirection
            return redirect()->route('menus.index')->with([
                'success' => 'menu modifier avec succés'
            ]);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Menu  $menu
     * @return \Illuminate\Http\Response
     */
    public function destroy(Menu $menu)
    {
        unlink(public_path('images/menus/'.$menu->image));
        $menu->delete();
        return redirect()->route('menus.index')->with([
            'success' => 'menu supprimer avec succés'
        ]);
    }
}
