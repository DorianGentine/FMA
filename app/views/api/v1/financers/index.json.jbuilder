json.financers @financers do |financer|
  json.extract! financer,
  :id,
  :name,
  :description,
  :logo
end



"type"=>"notification_event",
"app_id"=>"pfhokn92",
"data"=> {
  "type"=>"notification_event_data",
  "item"=>{
    "type"=>"conversation",
    "id"=>"22650028500",
    "created_at"=>1561731327,
    "updated_at"=>1561733481,
    "user"=>{
      "type"=>"user",
      "id"=>"5d1620ff6a379c40bd3c5d8b",
      "user_id"=>nil,
      "name"=>"Amélie Leclercq",
      "email"=>"a.lecl@hotmail.com",
      "do_not_track"=>nil
    },
    "assignee"=>{
      "type"=>"nobody_admin",
      "id"=>nil
    },
    "conversation_message"=>{
      "type"=>"conversation_message",
      "id"=>"366911083",
      "url"=>nil,
      "subject"=>"",
      "body"=>"<p>Bienvenu sur Financer Mon Autonomie!</p>\\n<p>Nous sommes très heureux de votre présence sur notre application. N'hésitez pas si vous avez une question. Je serais ravi de vous aider!</p>",
      "author"=>{
        "type"=>"admin",
        "id"=>"3261223"
      },
      "attachments"=>[]
    },
    "conversation_parts"=>{
      "type"=>"conversation_part.list",
      "conversation_parts"=>[{
        "type"=>"conversation_part",
        "id"=>"3306880735",
        "part_type"=>"comment",
        "body"=>"<p>Yooo</p>",
        "created_at"=>1561733481,
        "updated_at"=>1561733481,
        "notified_at"=>1561733481,
        "assigned_to"=>nil,
        "author"=>{
          "type"=>"user",
          "id"=>"5d1620ff6a379c40bd3c5d8b",
          "name"=>"Amélie Leclercq",
          "email"=>"a.lecl@hotmail.com"
        },
        "attachments"=>[],
        "external_id"=>nil
      }],
      "total_count"=>1
    },
    "conversation_rating"=>{},
    "open"=>true,
    "state"=>"open",
    "snoozed_until"=>nil,
    "read"=>true,
    "metadata"=>{},
    "tags"=>{
      "type"=>"tag.list",
      "tags"=>[]
    },
    "tags_added"=>{
      "type"=>"tag.list",
      "tags"=>[]
    },
    "links"=>{
      "conversation_web"=>"https://app.intercom.io/a/apps/pfhokn92/conversations/22650028500"}
  }
},





{
  "type"=>"notification_event",
  "app_id"=>"pfhokn92",
  "data"=>{
    "type"=>"notification_event_data",
    "item"=>{
      "type"=>"conversation",
      "id"=>"22651357038",
      "created_at"=>1561734814,
      "updated_at"=>1561734814,
      "user"=>{
        "type"=>"user",
        "id"=>"5d1620ff6a379c40bd3c5d8b",
        "user_id"=>nil,
        "name"=>"Amélie Leclercq",
        "email"=>"a.lecl@hotmail.com",
        "do_not_track"=>nil
      },
      "assignee"=>{
        "type"=>"nobody_admin",
        "id"=>nil
      },
      "conversation_message"=>{
        "type"=>"conversation_message",
        "id"=>"375744975",
        "url"=>"https://financermonautonomie.herokuapp.com/mon_espace/6/projet",
        "subject"=>"",
        "body"=>"<p>What up you ?</p>",
        "author"=>{
          "type"=>"user",
          "id"=>"5d1620ff6a379c40bd3c5d8b"
        },
        "attachments"=>[]
      },
      "conversation_parts"=>{
        "type"=>"conversation_part.list",
        "conversation_parts"=>[],
        "total_count"=>0
      },
      "conversation_rating"=>{},
      "open"=>true,
      "state"=>"open",
      "snoozed_until"=>nil,
      "read"=>true,
      "metadata"=>{},
      "tags"=>{
        "type"=>"tag.list",
        "tags"=>[]
      },
  "tags_added"=>{
    "type"=>"tag.list",
  "tags"=>[]},
  "links"=>{
    "conversation_web"=>"https://app.intercom.io/a/apps/pfhokn92/conversations/22651357038"}}},
  "links"=>{},
  "id"=>"notif_8e176736-6a88-4e9f-9ad7-7f7b1b28a1a0",
  "topic"=>"conversation.user.created",
  "delivery_status"=>"pending",
  "delivery_attempts"=>1,
  "delivered_at"=>0,
  "first_sent_at"=>1561734814,
  "created_at"=>1561734814,
  "self"=>nil,
  "format"=>:json,
  "controller"=>"api/v1/calendlies",
  "action"=>"intercom",
  "calendly"=>{
    "type"=>"notification_event",
  "app_id"=>"pfhokn92",
  "data"=>{
    "type"=>"notification_event_data",
  "item"=>{
    "type"=>"conversation",
  "id"=>"22651357038",
  "created_at"=>1561734814,
  "updated_at"=>1561734814,
  "user"=>{
    "type"=>"user",
  "id"=>"5d1620ff6a379c40bd3c5d8b",
  "user_id"=>nil,
  "name"=>"Amélie Leclercq",
  "email"=>"a.lecl@hotmail.com",
  "do_not_track"=>nil},
  "assignee"=>{
    "type"=>"nobody_admin",
  "id"=>nil},
  "conversation_message"=>{
    "type"=>"conversation_message",
  "id"=>"375744975",
  "url"=>"https://financermonautonomie.herokuapp.com/mon_espace/6/projet",
  "subject"=>"",
  "body"=>"<p>What up you ?</p>",
  "author"=>{
    "type"=>"user",
  "id"=>"5d1620ff6a379c40bd3c5d8b"},
  "attachments"=>[]},
  "conversation_parts"=>{
    "type"=>"conversation_part.list",
  "conversation_parts"=>[],
  "total_count"=>0},
  "conversation_rating"=>{},
  "open"=>true,
  "state"=>"open",
  "snoozed_until"=>nil,
  "read"=>true,
  "metadata"=>{},
  "tags"=>{
    "type"=>"tag.list",
  "tags"=>[]},
  "tags_added"=>{
    "type"=>"tag.list",
  "tags"=>[]},
  "links"=>{
    "conversation_web"=>"https://app.intercom.io/a/apps/pfhokn92/conversations/22651357038"}}},
  "links"=>{},
  "id"=>"notif_8e176736-6a88-4e9f-9ad7-7f7b1b28a1a0",
  "topic"=>"conversation.user.created",
  "delivery_status"=>"pending",
  "delivery_attempts"=>1,
  "delivered_at"=>0,
  "first_sent_at"=>1561734814,
  "created_at"=>1561734814,
  "self"=>nil}}"




































