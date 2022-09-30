
class UTComp_Menu_MainMenu extends PopupPageBase;

var automated array<GUIButton> UTCompMenuButtons;
var automated GUITabControl c_Main;
var automated FloatingImage i_FrameBG2;
var UTComp_Settings Settings;
var UTComp_HUDSettings HUDSettings;

simulated function SaveSettings()
{
    Log("Saving settings");
    Settings.SaveConfig();
}

simulated function SaveHUDSettings()
{
    Log("Saving HUD settings");
    HUDSettings.SaveConfig();
}

function InitComponent(GUIController MyController, GUIComponent MyComponent)
{
	super.InitComponent(MyController, MyComponent);
    Settings = BS_xPlayer(PlayerOwner()).Settings;
    HUDSettings = BS_xPlayer(PlayerOwner()).HUDSettings;
}

function bool InternalOnClick(GUIComponent C)
{
    if(C==UTCompMenuButtons[0])
        PlayerOwner().ClientReplaceMenu(string(class'UTComp_Menu_OpenedMenu'));

    else if(C==UTCompMenuButtons[1])
        PlayerOwner().ClientReplaceMenu(string(class'UTComp_Menu_Voting'));

    else if(C==UTCompMenuButtons[2])
        PlayerOwner().ClientCloseMenu();

    return false;
}

function OnClose(optional bool bCancelled)
{
   if(PlayerOwner().IsA('BS_xPlayer'))
   {
      BS_xPlayer(PlayerOwner()).ReSkinAll();
      BS_xPlayer(PlayerOwner()).InitializeScoreboard();
      BS_xPlayer(PlayerOwner()).MatchHudColor();
   }
   super.OnClose(bCancelled);
}

defaultproperties
{
     Begin Object class=GUIButton name=GameButton
         Caption="Game"
         WinTop=0.170000
         WinLeft=0.11250000
         WinWidth=0.180000
         WinHeight=0.060000
         OnClick=InternalOnClick
     End Object
     UTCompMenuButtons(0)=GUIButton'GameButton'

     Begin Object class=GUIButton name=VoteButton
         Caption="Vote"
         WinTop=0.170000
         WinLeft=0.31250000
         WinWidth=0.180000
         WinHeight=0.060000
         OnClick=InternalOnClick
     End Object
     UTCompMenuButtons(1)=GUIButton'VoteButton'

     Begin Object class=GUIButton name=CloseButton
         Caption="Close"
         WinTop=0.170000
         WinLeft=0.71250000
         WinWidth=0.180000
         WinHeight=0.060000
         OnClick=InternalOnClick
     End Object
     UTCompMenuButtons(2)=GUIButton'CloseButton'

     Begin Object Class=GUITabControl Name=LoginMenuTC
         bFillSpace=True
         bDockPanels=True
         TabHeight=0.08
         BackgroundStyleName=""
		 WinWidth=0.725325
		 WinHeight=0.208177
		 WinLeft=0.134782
	     WinTop=0.072718
         bScaleToParent=True
         bAcceptsInput=True
         OnActivate=LoginMenuTC.InternalOnActivate
     End Object
     c_Main=GUITabControl'UTComp_Menu_MainMenu.LoginMenuTC'


     Begin Object Class=FloatingImage Name=FloatingFrameBackground
         Image=Texture'2K4Menus.NewControls.Display99'
         ImageStyle=ISTY_Stretched
         ImageRenderStyle=MSTY_Normal
         WinTop=0.100000
         WinLeft=0.0750000
         WinWidth=0.850000
         WinHeight=0.750000
         bBoundToParent=False
         bScaleToParent=False
         RenderWeight = 0.01
         DropShadowX=0
         DropShadowY=0
     End Object
     i_FrameBG=FloatingImage'UTComp_Menu_MainMenu.FloatingFrameBackground'

     Begin Object Class=FloatingImage Name=FloatingFrameBackground2
         Image=Texture'2K4Menus.NewControls.Display95'
         ImageStyle=ISTY_Stretched
         ImageRenderStyle=MSTY_Normal
         WinTop=0.270000
         WinLeft=0.0750000
         WinWidth=0.850000
         WinHeight=0.580000
         bBoundToParent=False
         bScaleToParent=False
         RenderWeight = 0.02
         DropShadowX=0
         DropShadowY=0
     End Object
     i_FrameBG2=FloatingImage'UTComp_Menu_MainMenu.FloatingFrameBackground2'


  /*   bResizeWidthAllowed=False
     bResizeHeightAllowed=False
     bMoveAllowed=False      */
     bRequire640x480=True
     bAllowedAsLast=True
     WinWidth=1.000000
	 WinHeight=0.804690
	 WinLeft=0.000000
	 WinTop=0.114990
	 bPersistent=true

}
