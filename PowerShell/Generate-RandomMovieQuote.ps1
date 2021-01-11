# Author: Andrew P/hillips
# Date of last change: 10/18/17

<#
.Synopsis
    Hear your computer speak random quotes from a select group of movies and TV shows. 
.DESCRIPTION
   This script will randomly print on the screen quotes from Fight Club, V for Vendetta, and Rick and Morty. 
   In addition, the computer will actually say the quote aloud, so be sure that your speakers are turned on!
.EXAMPLE
   Point PowerShell to the location of the script, and run .\Generate-RandomMovieQuote
#>

# Asks user to make a selection of either 1, 2, 3, or Q.
# The number the user selects will produce a randomly selected quote from that particular movie or TV show. 
# There's a cache of 4 or 5 quotes from a certain film or TV show.
# Using the Get-Random cmdlet, it will randomly choose one of those quotes.
# After the quote is voiced/printed by the machine, it goes back to the menu.

# Using .NET to create audible speech.
Add-Type -AssemblyName System.Speech
$speech = New-Object -TypeName System.Speech.Synthesis.SpeechSynthesizer
$speech.Rate = -2




do { # The loop that make sure the other loops do their jobs until someone presses 'Q.'
    do { # Do this until an acceptable selection has been made.
        
        # Menu selection.
        Write-Host "To retrieve a random quote from a television show or movie, please choose one of the following options:
        1. Fight Club
        2. V for Vendetta
        3. Rick and Morty
        Q. Press Q to quit.
        "

        $choice = Read-Host "Please make a selection"
        
        Write-Host ""
        
        $ok = $choice -match '^[123q]+$'
        
        if ( -not $ok) {Write-Host "Invalid selection" 
                       Write-Host " "
                       Write-Host " " 
                       }
    } until ( $ok )
    
    switch -Regex ( $choice ) {
        "1"{
            # Cache of quotes from Fight Club.
            $fightClubQuote1 = "The things you own, end up owning you."
            $fightClubQuote2 = "Tonight, we make soap."
            $fightClubQuote3 = "You are not your khakis."
            $fightClubQuote4 = "First rule of Fight Club: you do not talk about Fight Club."
            $fightClubQuote5 = "It's only until we've lost everything, that we're free to do anything."
            
            # Using the Get-Random cmdlet to have the system make a random selection. 
            $randomFightClubQuote = Get-Random -InputObject $fightClubQuote1, $fightClubQuote2, $fightClubQuote3, $fightClubQuote4, $fightClubQuote5
            
            Write-Host $randomFightClubQuote # Writes quote to the terminal. 
            $speech.speak($randomFightClubQuote) # Computer says the quote aloud. 
            
            Write-Host " "
            }
        "2"{
            # Cache of quotes from V for Vendetta. 
            $vForVendettaQuote1 = "Remember, remember the fifth of November..."
            $vForVendettaQuote2 = "Ideas are bulletproof."
            $vForVendettaQuote3 = "If you're looking for the guilty, you need only look into a mirror."
            $vForVendettaQuote4 = "You wear a mask for so long, you forget who you were beneath it."
            $vForVendettaQuote5 = "A revolution without dancing is hardly a revolution worth having."
            
            # Using the Get-Random cmdlet to have the system make a random selection.
            $randomVforVendettaQuote = Get-Random -InputObject $vForVendettaQuote1, $vForVendettaQuote2, $vForVendettaQuote3, $vForVendettaQuote4, $vForVendettaQuote5
            
            Write-Host $randomVforVendettaQuote # Writes quote to the terminal.
            Write-Host " "
            $speech.speak($randomVforVendettaQuote) # Computer says the quote aloud. 
            }
        "3"{
            # Cache of quotes from Rick and Morty.
            $rickAndMortyQuote1 = "Get Shwifty!"
            $rickAndMortyQuote2 = "Peace amongst worlds."
            $rickAndMortyQuote3 = "Can somebody let me out of here? If I die in a cage I lose a bet."
            $rickAndMortyQuote4 = "Wubba-lubba-dub-dub!"
            $rickAndMortyQuote5 = "Show me what you got!"

            # Using the Get-Random cmdlet to have the system make a random selection.
            $randomRickandMortyQuote = Get-Random -InputObject $rickAndMortyQuote1, $rickAndMortyQuote2, $rickAndMortyQuote3, $rickAndMortyQuote4, $rickAndMortyQuote5
            
            Write-Host $randomRickandMortyQuote # Writes quote to the terminal. 
            Write-Host " "
            $speech.speak($randomRickandMortyQuote) # Computer says the quote aloud. 

           }
        
    }
} until ( $choice -match "Q" ) # When the user is done with movie quotes. 