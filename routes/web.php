<?php

use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::get('/', fn() => Inertia::render('Home'))->name('home');
Route::get('/contact', fn() => Inertia::render('Contact'))->name('contact');

// Contact form submission
Route::post('/contact', function (\Illuminate\Http\Request $request) {
    $validated = $request->validate([
        'name'    => 'required|string|max:100',
        'email'   => 'required|email',
        'message' => 'required|string|max:2000',
    ]);

    // Send email or save to DB here
    // Mail::to('you@email.com')->send(new ContactMail($validated));

    return back()->with('success', 'Message sent! I\'ll get back to you soon.');
})->name('contact.send');