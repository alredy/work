data_bag grammarly_users
      user1.json

"id": "user1",
  "roles":    {
                "role1": "",
                "role2": "grpup1",
                "role3": [
                          "group1",
                          "group2",
                          "group3"
                          ]
              },
  "ssh_keys": [
              "ssh-key1",
              "ssh-key3"
              ],
  "groups": "group1" #add user to group if roles:group empty 
  "sudo": ["sudo_rule1", "sudo_rule2"]