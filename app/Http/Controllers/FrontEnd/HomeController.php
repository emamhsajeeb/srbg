<?php


namespace App\Http\Controllers\FrontEnd;


use App\CMS;

class HomeController {

	public function index()
	{
		return view('frontend.cms.home',compact('home'));
	}


}