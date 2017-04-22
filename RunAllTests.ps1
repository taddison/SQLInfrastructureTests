$servers = @('localhost','.')

Invoke-Pester -Script @{Path='.';Parameters= @{servers=$servers}}