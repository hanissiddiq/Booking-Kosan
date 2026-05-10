@extends('layouts.app')
@section('content')
    <div id="Background"
        class="absolute top-0 w-full h-[430px] rounded-b-[75px] bg-[linear-gradient(180deg,#F2F9E6_0%,#D2EDE4_100%)]">
    </div>
    <div class="relative flex flex-col gap-[30px] my-[60px] px-5">
        <h1 class="font-bold text-[30px] leading-[45px] text-center">Need Help for<br>Kosan Apps</h1>

        <div class="flex flex-col rounded-[30px] border border-[#F1F2F6] p-5 gap-6 bg-white">
            <div id="InputContainer" class="flex flex-col gap-[18px]">

                <p class="font-semibold text-center text-ngekos-grey">Hubungi kami melalui salah satu kontak berikut</p>

                {{-- WhatsApp Card --}}
                <a href="https://wa.me/62082211887735" target="_blank"
                    class="flex items-center w-full rounded-[20px] p-[14px_20px] gap-3 bg-white ring-1 ring-[#F1F2F6] hover:ring-[#91BF77] transition-all duration-300">
                    <div class="flex items-center justify-center w-10 h-10 rounded-full bg-[#F2F9E6] shrink-0">
                        <img src="assets/images/icons/note-favorite-grey.svg" class="w-5 h-5" alt="icon">
                    </div>
                    <div class="flex flex-col">
                        <p class="font-semibold text-sm">WhatsApp Admin</p>
                        <p class="text-ngekos-grey text-sm">+62 822 1188 735</p>
                    </div>
                    {{-- <img src="assets/images/icons/arrow-down.svg" class="w-5 h-5 ml-auto -rotate-90" alt="icon"> --}}
                </a>

                {{-- Email Card --}}
                <a href="mailto:atrakana@gmail.com"
                    class="flex items-center w-full rounded-[20px] p-[14px_20px] gap-3 bg-white ring-1 ring-[#F1F2F6] hover:ring-[#91BF77] transition-all duration-300">
                    <div class="flex items-center justify-center w-10 h-10 rounded-full bg-[#F2F9E6] shrink-0">
                        <img src="assets/images/icons/location.svg" class="w-5 h-5" alt="icon">
                    </div>
                    <div class="flex flex-col">
                        <p class="font-semibold text-sm">Email Developer</p>
                        <p class="text-ngekos-grey text-sm">atrakana@gmail.com</p>
                    </div>
                    {{-- <img src="assets/images/icons/arrow-down.svg" class="w-5 h-5 ml-auto -rotate-90" alt="icon"> --}}
                </a>

                {{-- Developer Info --}}
                <div class="flex flex-col items-center gap-1 pt-2 border-t border-[#F1F2F6]">
                    <p class="text-ngekos-grey text-xs">Developed by</p>
                    <p class="font-semibold text-sm">Atrakana Corporation</p>
                </div>

                {{-- WhatsApp Button --}}
                <a href="https://wa.me/6208221188735" target="_blank"
                    class="flex w-full justify-center rounded-full p-[14px_20px] bg-ngekos-orange font-bold text-white">
                    Chat via WhatsApp
                </a>

            </div>
        </div>
    </div>
    @include('includes.navigation')
@endsection
