/*
 * Copyright (C) 2009 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package android.accounts;

import android.accounts.IAccountAuthenticatorResponse;
import android.accounts.Account;
import android.os.Bundle;

/**
 * Service that allows the interaction with an authentication server.
 */
oneway interface IAccountAuthenticator {
    /**
     * prompts the user for account information and adds the result to the IAccountManager
     */
    void addAccount(in IAccountAuthenticatorResponse response, String accountType,
        String authTokenType, in String[] requiredFeatures, in Bundle options);

    /**
     * Checks that the account/password combination is valid.
     * @deprecated
     */
    void confirmPassword(in IAccountAuthenticatorResponse response,
        in Account account, String password);

    /**
     * prompts the user for the credentials of the account
     */
    void confirmCredentials(in IAccountAuthenticatorResponse response, in Account account);

    /**
     * gets the password by either prompting the user or querying the IAccountManager
     */
    void getAuthToken(in IAccountAuthenticatorResponse response, in Account account,
        String authTokenType, in Bundle options);

    /**
     * prompts the user for a new password and writes it to the IAccountManager
     */
    void updateCredentials(in IAccountAuthenticatorResponse response, in Account account,
        String authTokenType, in Bundle options);

    /**
     * launches an activity that lets the user edit and set the properties for an authenticator
     */
    void editProperties(in IAccountAuthenticatorResponse response, String accountType);

    /**
     * returns a Bundle where the boolean value BOOLEAN_RESULT_KEY is set if the account has the
     * specified features
     */
    void hasFeatures(in IAccountAuthenticatorResponse response, in Account account, 
        in String[] features);
}
