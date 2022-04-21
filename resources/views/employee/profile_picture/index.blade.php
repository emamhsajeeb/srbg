<span id="profile_form_result"></span>
<div id="employee_profile_photo">
    @if($employee->user->profile_photo)
        <div><img src="{{url('public/uploads/profile_photos',$employee->user->profile_photo)}}" style="aspect-ratio: 4/5;" width="50%">
        </div>
    @else
        <div><img src="{{url('public/logo/avatar.jpg')}}" style="aspect-ratio: 4/5;" width="50%">
        </div>
    @endif
</div>

<form method="post" id="profile_sample_form" class="form-horizontal" autocomplete="off" enctype="multipart/form-data">

    @csrf

    <div class="form-group">
        <input type="hidden" name="employee_username" value="{{$employee->user->username}}">
        <input type="file"
               required class="form-control @error('photo') is-invalid @enderror"
               name="profile_photo" placeholder="{{__('Upload',['key'=>trans('file.Photo')])}}">
    </div>
    <div class="form-group">
        <input type="submit" name="action_button" id="action_button" class="btn btn-warning" value={{trans('file.Save')}}>
    </div>
</form>