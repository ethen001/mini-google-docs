package org.guccigang.mini_google_docs.controller;

import javafx.event.ActionEvent;
import org.guccigang.mini_google_docs.GuiUtil;
import org.guccigang.mini_google_docs.model.UserObject;

import java.io.IOException;

public class SuperUserUIController {

    private UserObject currentUser;

    public SuperUserUIController() {
        this(null);
    }

    public SuperUserUIController(UserObject currentUser) {
        this.currentUser = currentUser;
    }

    public void signOutButton(ActionEvent event){
        try {

            GuiUtil.createWindowAndDestroy(event,"views/login.fxml", "Gucci Gang");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public void handleTabooList(ActionEvent event){
        try{
            GuiUtil.createWindow(event, "views/tabooSUListView.fxml","Manage Taboo List");
        }catch (IOException e){
            e.printStackTrace();
        }
    }
    public void handleDocumentManager(ActionEvent event) {
        try {
            GuiUtil.changeScene(event, "views/SuperAndOriginalDocManager.fxml", "Document Manager");
        }catch (IOException e) {
            e.printStackTrace();
        }
    }
}
