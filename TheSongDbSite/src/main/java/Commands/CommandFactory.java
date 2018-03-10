/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

/**
 *
 * @author Thomas
 */
public class CommandFactory {

    private volatile static CommandFactory currentInstance;

    private CommandFactory() {

    }

    public static CommandFactory getInstance() {

        if (currentInstance == null) {
            synchronized (CommandFactory.class) {
                if (currentInstance == null) {
                    currentInstance = new CommandFactory();
                }
            }
        }
        return currentInstance;
    }

    public static Command createCommand(String action) {
        // Create a command object to hold what we action we wish to take
        Command command = null;

        // Confirm an action variable was supplied
        if (action != null) {
            // Choose which action to carry out
            // Deal with if the user wants to update a customer
            switch (action) {
                // Deal with if the user wants to view all customer information
                case "login":
                    command = new LoginCommand();
                    break;

                case "register":
                    command = new RegisterCommand();
                    break;

//                case "allUsers":
//                    command = new ViewAllUsersCommand();
//                    break;
                case "changeLanguage":
                    command = new ChangeLanguageCommand();
                    break;
                case "sendMessage":
                    command = new SendMessageCommand();
                    break;
                case "deleteMessage":
                    command = new DeleteMessageCommand();
                    break;
                case "deleteStatus":
                    command = new DeleteStatusCommand();
                    break;
                case "updateStatus":
                    command = new UpdateStatusCommand();
                    break;
                case "search":
                    command = new SearchCommand();
                    break;
                case "logout":
                    command = new LogoutCommand();
                    break;
//                case "editUser":
//                    command = new EditUserCommand();
//                    break;

                default:
                    command = new NoValidActionCommand();
                    break;
            }

        } else {
            // Deal with where there was no action supplied as part of this request
            command = new NoActionSuppliedCommand();
        }

        return command;
    }

}
