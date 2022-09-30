

class UTComp_Menu_Voting extends UTComp_Menu_MainMenu;

var automated GUIButton bu_MapChangeMenu;

function bool InternalOnClick(GUIComponent C)
{
    switch(C)
    {
        case bu_MapChangeMenu:  PlayerOwner().ClientReplaceMenu(string(class'UTComp_Menu_Voting_Map'));  break;
    }
    Blehz();
    return super.InternalOnClick(C);
}

event Opened(guicomponent sender)
{
    Super.Opened(sender);

   Blehz();
}

function Blehz()
{
    local UTComp_ServerReplicationInfo RepInfo;

    foreach PlayerOwner().DynamicActors(class'UTComp_ServerReplicationInfo', RepInfo)
         break;
    if((RepInfo.bEnableMapVoting==false && RepInfo.bAllowRestartVoteEvenIfMapVotingIsTurnedOff == false) || RepInfo.bEnableVoting==false)
        bu_MapChangeMenu.DisableMe();
    else
        bu_MapChangeMenu.EnableMe();
}

defaultproperties
{
     Begin Object Class=GUIButton Name=MapChangeButton
         Caption="Change Map"
		WinWidth=0.373751
		WinHeight=0.123437
		WinLeft=0.315625
		WinTop=0.449999
         OnClick=UTComp_Menu_Voting.InternalOnClick
         OnKeyEvent=MapChangeButton.InternalOnKeyEvent
     End Object
     bu_MapChangeMenu=GUIButton'UTComp_Menu_Voting.MapChangeButton'
}
