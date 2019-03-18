
help Get-AzureRmTag -ShowWindow

$Tags = Get-AzureRmTag

get-help Get-AzureRmResource -ShowWindow

$VMs = Get-AzureRmVm

$VMs[1].Tags | fl *

$VMs[1].Tags | Select-Object -ExpandProperty keys | Select-Object -Property Keys -Unique 

$VMs.Tags | Select-Object -ExpandProperty keys | Select-Object -Unique | Sort-Object

$VMs.Tags | Select-Object -ExpandProperty keys | Measure-Object


Select-Object -Property Key


# Find all Tag Names

$UniqueTags = $VMs.Tags | Select-Object -ExpandProperty keys | Select-Object -Unique | Sort-Object

$VMsTags = @()

foreach ($VM in $VMs) {
    $VMTag = New-Object -TypeName PSObject
    Add-Member -InputObject $VMTag -MemberType NoteProperty -Name Name -Value $VM.Name
    
    foreach ($UniqueTag in $UniqueTags) {
        # Write-Host "UniqueTag $UniqueTag"
        # $VM.Tags
        $TagValue = $Null

        if ($VMs[0].Tags.ContainsKey("ProjectName") ) { 
            $TagValue = $VM.Tags.$UniqueTag
        }

        Add-Member -InputObject $VMTag -MemberType NoteProperty -Name $UniqueTag -Value $TagValue
    }
    $VMsTags += $VMTag
}

if ($VMs[0].Tags.ContainsKey("ProjectName") ) { 

}

$VMs[0].Tags.ContainsKey("ProjectName")

$VMs[0].Tags.TryGetValue(\"ProjectName\")

$VMs[0].Tags.Keys("ProjectName")

$VMs[0].Tags.ProjectName

