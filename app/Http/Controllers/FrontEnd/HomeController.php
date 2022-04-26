<?php


namespace App\Http\Controllers\FrontEnd;


use App\CMS;

class HomeController extends Controller {

	public function index()
	{
		return view('frontend.cms.home');
	}


}