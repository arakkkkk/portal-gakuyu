Rails.application.routes.draw do
  get 'gakuyu_info/new'
get     'login',   to: 'sessions#new'
post    'login',   to: 'sessions#create'
delete  'logout',  to: 'sessions#destroy'

get "none" => "sessions#none"
get "home" => "sessions#index"
get "rental" => "home#rental"
get "facility" => "home#facility"

get "portal_login"  => "sessions#portal_login"
post "portal_login"  => "sessions#portal_create"

get "portal_index" => "portal#portal_index"
get "portal_intro"  => "portal#portal_intro"
get "portal_intro2"  => "portal#portal_intro2"
get "portal_addparent" => "portal#portal_addparent"
post "portal_addparent" => "portal#portal_addparent"
get "portal_addchild" => "portal#portal_addchild"
post "portal_addchild" => "portal#portal_addchild"
get "portal1" => "portal#portal1"
get "portal2" => "portal#portal2"
get "portal3" => "portal#portal3"
get "portal_request" => "portal#portal_request"
get "portal_request2" => "portal#portal_request2"
patch "portal_request2" => "portal#portal_request2"
get "club_editnav" => "portal#club_editnav"
post "club_editnav" => "portal#club_addnav"
post "club_addnavparent" => "portal#club_addnavparent"
post "club_addnavchild" => "portal#club_addnavchild"
post "club_addnavchild2" => "portal#club_addnavchild2"
patch "club_editcontent" => "portal#club_editcontent"
get "portal_editaccount" => "portal#portal_editaccount"
patch "portal_updateaccount" => "portal#portal_updateaccount"
get "delete_portalnav" => "portal#delete_portalnav"
delete "delete_portalnav.:format" => "portal#delete_portalnav"
get "delete_parent" => "portal#delete_parent"
delete "delete_parent.:format" => "portal#delete_portalnav"
get "portal_allmessage" => "portal#portal_allmessage"

get "kportal_index" => "kportal#kportal_index"
get "kportal_intro"  => "kportal#kportal_intro"
get "kportal_intro2"  => "kportal#kportal_intro2"
get "kportal_addparent" => "kportal#kportal_addparent"
post "kportal_addparent" => "kportal#kportal_addparent"
get "kportal_addchild" => "kportal#kportal_addchild"
post "kportal_addchild" => "kportal#kportal_addchild"
post "kclub_addnavchild2" => "kportal#kclub_addnavchild2"
get "kportal1" => "kportal#kportal1"
get "kportal2" => "kportal#kportal2"
get "kportal3" => "kportal#kportal3"
get "kportal_request" => "kportal#kportal_request"
get "kportal_request2" => "kportal#kportal_request2"
patch "kportal_request2" => "kportal#kportal_request2"
get "kclub_editnav" => "kportal#kclub_editnav"
post "kclub_editnav" => "kportal#kclub_addnav"
post "kclub_addnavparent" => "kportal#kclub_addnavparent"
post "kclub_addnavchild" => "kportal#kclub_addnavchild"
patch "kclub_editcontent" => "kportal#kclub_editcontent"
get "kportal_account" => "kportal#kportal_account"
get "kportal_editaccount" => "kportal#kportal_editaccount"
patch "kportal_updateaccount" => "kportal#kportal_updateaccount"
get "kdelete_portalnav" => "kportal#kdelete_portalnav"
delete "kdelete_portalnav.:format" => "kportal#kdelete_portalnav"
get "kdelete_parent" => "kportal#kdelete_parent"
delete "kdelete_parent.:format" => "kportal#kdelete_portalnav"
get "kportal_allmessage" => "kportal#kportal_allmessage"

get "kportal_note" => "kportal#kportal_note"
get "kportal_addnotetwo" => "kportal#kportal_addnotetwo"
post "addnotetwo" => "kportal#addnotetwo"
get "kportal_addnotethree" => "kportal#kportal_addnotethree"
post "addnotethree" => "kportal#addnotethree"
get "notetodo" => "kportal#notetodo"
get "toggletodo" => "kportal#toggletodo"
patch "toggletodo" => "kportal#toggletodo"
post "addnote" => "kportal#addnote"
get "notecontent" => "kportal#notecontent"
get "notecontent2" => "kportal#notecontent2"
patch "editnote" => "kportal#editnote"
get "notenote" => "kportal#notenote"
get "notenote2" => "kportal#notenote2"
get "delete_notelist" => "kportal#delete_notelist"
delete "delete_notelist" => "kportal#delete_notelist"


get "gakuyu_info_new" => "gakuyu_info#gakuyu_info_new"
post "gakuyu_info_new" => "gakuyu_info#gakuyu_info_new"
post "gakuyu_info_create" => "gakuyu_info#gakuyu_info_create"
get "gakuyu_info_checked" => "gakuyu_info#gakuyu_info_checked"
patch "gakuyu_info_checked" => "gakuyu_info#gakuyu_info_checked"
get "gakuyu_info_edit.:format" => "gakuyu_info#gakuyu_info_edit"
patch "gakuyu_info_update.:format" => "gakuyu_info#gakuyu_info_update"
get "gakuyu_info_destroy.:format" => "gakuyu_info#gakuyu_info_destroy"
delete "gakuyu_info_destroy.:format" => "gakuyu_info#gakuyu_info_destroy"
get "gakuyu_info_s" => "gakuyu_info#gakuyu_info_s"
patch "gakuyu_info_s" => "gakuyu_info#gakuyu_info_s"
get "gakuyu_info1_content" => "gakuyu_info#gakuyu_info1_content"

get "gakuyu_info1" => "gakuyu_info#gakuyu_info1"
post "gakuyu_info1" => "gakuyu_info#gakuyu_info1"
get "gakuyu_info1_new" => "gakuyu_info#gakuyu_info1_new"
get "gakuyu_info1_create" => "gakuyu_info#gakuyu_info1_create"
post "gakuyu_info1_create" => "gakuyu_info#gakuyu_info1_create"

get "gakuyu_info2" => "gakuyu_info#gakuyu_info2"
post "gakuyu_info2" => "gakuyu_info#gakuyu_info2"
get "gakuyu_info2_new" => "gakuyu_info#gakuyu_info2_new"
get "gakuyu_info3" => "gakuyu_info#gakuyu_info3"
post "gakuyu_info3" => "gakuyu_info#gakuyu_info3"
get "gakuyu_info3_new" => "gakuyu_info#gakuyu_info3_new"
get "gakuyu_info4" => "gakuyu_info#gakuyu_info4"
post "gakuyu_info4" => "gakuyu_info#gakuyu_info4"
get "gakuyu_info4_new" => "gakuyu_info#gakuyu_info4_new"






get "events" => "kyokuin#events"
get "events_new" => "kyokuin#events_new"
post "events_new" => "kyokuin#events_create"
get "event_one" => "kyokuin#event_one"
get "event_edit.:format" => "kyokuin#event_edit"
patch "event_edit" => "kyokuin#event_edit_action"
delete "delevent" => "kyokuin#delevent"
delete "delevent.:format" => "kyokuin#delevent"

get "settings" => "kyokuin#settings"


get "jimu" => "equipment#jimu"
get "jimu2" => "equipment#jimu2"
post "jimu2" => "equipment#create"

get "jimu3" => "equipment#jimu3"
delete "jimu3" => "equipment#destroy"
resources :equipment, :only => [:edit, :destroy]
get "jimu3_edit.:id" => "equipment#jimu3_edit"
get "jimu3_edit/:id" => "equipment#edit_equipment"
patch "jimu3_edit/:id" => "equipment#edit_equipment"
put "jimu3_edit" => "equipment#edit_equipment"
#post "users" => "sessions#create" 


get "jimu4" => "equipment#jimu4"
get "jimu4_edit" => "equipment#jimu4_edit"
get "jimu4_edit.:format" => "equipment#edit_kyoyuhainoti"
patch "jimu4_edit.:format" => "equipment#edit_kyoyuhainoti"
#put "jimu4_edit.:format" => "equipment#edit_kyoyuhainoti"
delete "kyoyuhainoti/:id" => "equipment#kdestroy"

resources :kyoyuhainoti, :only => [:edit, :destroy]

get "jimu5" => "equipment#jimu5"
post "jimu5" => "equipment#share"
get "jimu6" => "equipment#jimu6"
post "jimu6" => "equipment#jimu6"
post "jimu6_new" => "equipment#jimu6_new"





get "kyokuin_kasidasische" => "kyokuin#kyokuin_kasidasische"
get "kyokuin_musicsche" => "kyokuin#kyokuin_musicsche"
get "kyokuin_meetsche" => "kyokuin#kyokuin_meetsche"
get "kyokuin_othersche" => "kyokuin#kyokuin_othersche"
get "kyokuin_actsche" => "kyokuin#kyokuin_actsche"

get "kyokuin1" => "kyokuin#kyokuin1"
get "kyokuin1_new" => "kyokuin#kyokuin1_new"
post "kyokuin1_new" => "kyokuin#kyokuin1_save"
get "kyokuin1_edit" => "kyokuin#kyokuin1_edit"
get "kyokuin1_edit.:format" => "kyokuin#hikitugi"
patch "kyokuin1_edit.:format" => "kyokuin#hikitugi"
delete "kyokuin1.:format" => "kyokuin#kyokuin1_destroy"

get "kyokuin2" => "kyokuin#kyokuin2"
get "kyokuin2_edit" => "kyokuin#kyokuin2_edit"
get "kyokuin2_update.:format" => "kyokuin#kyokuin2_update"
patch "kyokuin2_update.:format" => "kyokuin#kyokuin2_update"
get "kyokuin2_henkyaku" => "kyokuin#kyokuin2_henkyaku"
get "kyokuin2_new.:format" => "kyokuin#kyokuin2_new"
post "kyokuin2_new.:format" => "kyokuin#kyokuin2_new"
get "kyokuin2_kyoka" => "kyokuin#kyokuin2_kyoka"
get "kyokuin2_kasidasi" => "kyokuin#kyokuin2_kasidasi"
get "kyokuin2_update.:format" => "kyokuin#kyokuin2_update"
patch "kyokuin2_update.:format" => "kyokuin#kyokuin2_update"
delete "deletedata" => "kyokuin#destroy"
delete "deletedata.:format" => "kyokuin#destroy"
get "kyokuin2_itiran" => "kyokuin#kyokuin2_itiran"
get "kyokuin4_itiran" => "kyokuin#kyokuin4_itiran"
get "kyokuin2_one" => "kyokuin#kyokuin2_one"
patch "kyokuin2_crecre" => "kyokuin#kyokuin2_crecre"
patch "kyokuin2_create" => "kyokuin#kyokuin2_create"
patch "kyokuin2_create.:format" => "kyokuin#kyokuin2_create"

get "kyokuin3" => "kyokuin#kyokuin3"
get "kyokuin3_edit" => "kyokuin#kyokuin3_edit"
get "kyokuin3_update.:format" => "kyokuin#kyokuin3_update"
patch "kyokuin3_update.:format" => "kyokuin#kyokuin3_update"
get "kyokuin3_henkyaku" => "kyokuin#kyokuin3_henkyaku"
get "kyokuin3_new.:format" => "kyokuin#kyokuin3_new"
post "kyokuin3_new.:format" => "kyokuin#kyokuin3_new"
get "kyokuin3_kyoka" => "kyokuin#kyokuin3_kyoka"
get "kyokuin3_kasidasi" => "kyokuin#kyokuin3_kasidasi"
get "kyokuin3_update.:format" => "kyokuin#kyokuin3_update"
patch "kyokuin3_update.:format" => "kyokuin#kyokuin3_update"
get "kyokuin3_one" => "kyokuin#kyokuin3_one"
patch "kyokuin3_crecre" => "kyokuin#kyokuin3_crecre"
patch "kyokuin3_create" => "kyokuin#kyokuin3_create"
patch "kyokuin3_create.:format" => "kyokuin#kyokuin3_create"
delete "deletedata2" => "kyokuin#destroy2"
delete "deletedata2.:format" => "kyokuin#destroy2"



get "kyokuin4" => "kyokuin#kyokuin4"

get "kyokuin5" => "kyokuin#kyokuin5"

get "kyokuin6" => "kyokuin#kyokuin6"
get "kyokuin6_serch" => "kyokuin#kyokuin6_search"
post "kyokuin6" => "kyokuin#kyokuin6_search"



patch "kyokuin2_henkyaku.:format" => "kyokuin#kyokuin2_henkyaku"


get "uketuke_new" => "uketuke#uketuke_new"
post "uketuke_new" => "uketuke#uketuke_create"
# patch "uketuke_new" => "uketuke#uketuke_create"

get "uketuke1" => "uketuke#uketuke1"
get "uketuke1_new" => "uketuke#uketuke1_new"
post "uketuke1_new.:format" => "uketuke#uketuke1_create"
get "/uketuke/uketuke1_new"
post "uketuke1_create" => "uketuke#uketuke1_rentalinfo"

get "uketuke_soudaisai_new" => "uketuke#uketuke_soudaisai_new"

get "uketuke2" => "uketuke#uketuke2"
get "uketuke2_new" => "uketuke#uketuke2_new"
post "uketuke2_back" => "uketuke#uketuke2_back"
post "uketuke2_create" => "uketuke#uketuke2_create"



get "uketuke3" => "uketuke#uketuke3"
get "uketuke3_new" => "uketuke#uketuke3_new"
post "uketuke3_back" => "uketuke#uketuke3_back"
post "uketuke3_create" => "uketuke#uketuke3_create"

get "uketuke4" => "uketuke#uketuke4"
get "uketuke4_new" => "uketuke#uketuke4_new"
post "uketuke4_new" => "uketuke#uketuke4_create"
post "uketuke4_create" => "uketuke#uketuke4_create"

get "uketuke5" => "uketuke#uketuke5"
get "uketuke5_create" => "uketuke#uketuke5_create"
post "uketuke5" => "uketuke#uketuke5"
post "uketuke55" => "uketuke#import"
post "uketuke5_create" => "uketuke#uketuke5_create"
# resources :uketuke do
#   collection { post :import }
# end


get "club1" => "club#club1"
post "club1" => "club#club1_create"

get "club2" => "club#club2"

get "buseki" => "buseki#buseki"

get "buseki1" => "buseki#buseki1"
post "buseki1" => "buseki#buseki1_create"
get "buseki2" => "buseki#buseki2"

get "soudaisai_bihin" => "kyokuin#soudaisai_bihin"
get "soudaisai_club" => "kyokuin#soudaisai_club"
get "soudaisai_time" => "kyokuin#soudaisai_time"

get "soudaisai_edit" => "kyokuin#soudaisai_edit"
get "soudaisai_update.:format" => "kyokuin#soudaisai_update"
patch "soudaisai_update.:format" => "kyokuin#soudaisai_update"
delete "s_destroy" => "kyokuin#s_destroy"
delete "s_destroy.:format" => "kyokuin#s_destroy"
get "soudaisai_kasidasi" => "kyokuin#soudaisai_kasidasi"
get "soudaisai_kasidasi.:format" => "kyokuin#soudaisai_kasidasi"
get "soudaisai_henkyaku" => "kyokuin#soudaisai_henkyaku"
get "soudaisai_henkyaku.:format" => "kyokuin#soudaisai_henkyaku"

get "soudaisai_list" => "kyokuin#soudaisai_list"

get "support" => "kyokuin#support"
get "support_new" => "uketuke#support_new"
post "support_new" => "uketuke#support_create"
get "support_one" => "kyokuin#support_one"
get "support_one.:format" => "kyokuin#support_one"
delete "support_one.:format" => "kyokuin#support_one"
get "support_edit.:format" => "kyokuin#support_edit"
get "support_edit" => "kyokuin#support_edit"
patch "support_edit.:format" => "kyokuin#support_update"

get "user_kasidasi" => "uketuke#user_kasidasi"
get "user_kasidasi.:format" => "uketuke#user_kasidasi"

get "howto_user" => "uketuke#howto_user"




end
