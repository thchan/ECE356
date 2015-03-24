/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ece356_project;

/**
 *
 * @author Sean
 */
public class FriendRequest {
    public String user_alias;
    public String email;
    
        public FriendRequest(String user_alias, String email){
            this.user_alias = user_alias;
            this.email = email;
	}
}
