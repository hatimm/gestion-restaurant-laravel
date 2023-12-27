<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Servants extends Model
{
    protected $fillable = ["name","adresse","phone"];
    public function sales(){
        return $this->hasMany(Sales::class);
    }
}
