
# ----------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for license information.
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is regenerated.
# ----------------------------------------------------------------------------------

<#
.Synopsis
Updates entity in users
.Description
Updates entity in users
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

APPROLEASSIGNMENT <IMicrosoftGraphAppRoleAssignmentAutoGenerated2[]>: Represents the app roles a user has been granted for an application. Supports $expand.
  [DeletedDateTime <DateTime?>]: 
  [Id <String>]: Read-only.
  [AppRoleId <String>]: The identifier (id) for the app role which is assigned to the principal. This app role must be exposed in the appRoles property on the resource application's service principal (resourceId). If the resource application has not declared any app roles, a default app role ID of 00000000-0000-0000-0000-000000000000 can be specified to signal that the principal is assigned to the resource app without any specific app roles. Required on create.
  [CreatedDateTime <DateTime?>]: The time when the app role assignment was created.The Timestamp type represents date and time information using ISO 8601 format and is always in UTC time. For example, midnight UTC on Jan 1, 2014 is 2014-01-01T00:00:00Z. Read-only.
  [PrincipalDisplayName <String>]: The display name of the user, group, or service principal that was granted the app role assignment. Read-only. Supports $filter (eq and startswith).
  [PrincipalId <String>]: The unique identifier (id) for the user, group or service principal being granted the app role. Required on create.
  [PrincipalType <String>]: The type of the assigned principal. This can either be User, Group or ServicePrincipal. Read-only.
  [ResourceDisplayName <String>]: The display name of the resource app's service principal to which the assignment is made.
  [ResourceId <String>]: The unique identifier (id) for the resource service principal for which the assignment is made. Required on create. Supports $filter (eq only).

IDENTITY <IMicrosoftGraphObjectIdentity[]>: Represents the identities that can be used to sign in to this user account. An identity can be provided by Microsoft (also known as a local account), by organizations, or by social identity providers such as Facebook, Google, and Microsoft, and tied to a user account. May contain multiple items with the same signInType value. Supports $filter (eq) only where the signInType is not userPrincipalName.
  [Issuer <String>]: Specifies the issuer of the identity, for example facebook.com.For local accounts (where signInType is not federated), this property is the local B2C tenant default domain name, for example contoso.onmicrosoft.com.For external users from other Azure AD organization, this will be the domain of the federated organization, for example contoso.com.Supports $filter. 512 character limit.
  [IssuerAssignedId <String>]: Specifies the unique identifier assigned to the user by the issuer. The combination of issuer and issuerAssignedId must be unique within the organization. Represents the sign-in name for the user, when signInType is set to emailAddress or userName (also known as local accounts).When signInType is set to: emailAddress, (or a custom string that starts with emailAddress like emailAddress1) issuerAssignedId must be a valid email addressuserName, issuerAssignedId must be a valid local part of an email addressSupports $filter. 100 character limit.
  [SignInType <String>]: Specifies the user sign-in types in your directory, such as emailAddress, userName or federated. Here, federated represents a unique identifier for a user from an issuer, that can be in any format chosen by the issuer. Additional validation is enforced on issuerAssignedId when the sign-in type is set to emailAddress or userName. This property can also be set to any custom string.

PASSWORDPROFILE <IMicrosoftGraphPasswordProfile>: passwordProfile
  [(Any) <Object>]: This indicates any property can be added to this object.
  [ForceChangePasswordNextSignIn <Boolean?>]: true if the user must change her password on the next login; otherwise false. If not set, default is false. NOTE:  For Azure B2C tenants, set to false and instead use custom policies and user flows to force password reset at first sign in. See Force password reset at first logon.
  [ForceChangePasswordNextSignInWithMfa <Boolean?>]: If true, at next sign-in, the user must perform a multi-factor authentication (MFA) before being forced to change their password. The behavior is identical to forceChangePasswordNextSignIn except that the user is required to first perform a multi-factor authentication before password change. After a password change, this property will be automatically reset to false. If not set, default is false.
  [Password <String>]: The password for the user. This property is required when a user is created. It can be updated, but the user will be required to change the password on the next login. The password must satisfy minimum requirements as specified by the user’s passwordPolicies property. By default, a strong password is required.
.Link
https://docs.microsoft.com/powershell/module/az.resources/update-azaduser
#>
function Update-AzADUser {
    [OutputType([System.Boolean])]
    [CmdletBinding(DefaultParameterSetName='UPNOrObjectIdParameterSet', PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
    [Alias('Set-AzADUser')]
    param(
        [Parameter(ParameterSetName='UPNOrObjectIdParameterSet', Mandatory)]
        [System.String]
        # The user principal name or object id of the user to be updated.
        ${UPNOrObjectId},
        
        [Parameter(ParameterSetName='ObjectIdParameterSet', Mandatory)]
        [System.String]
        # The user principal name of the user to be updated.
        ${ObjectId},
        
        [Parameter(ParameterSetName = 'InputObjectParameterSet', Mandatory, ValueFromPipeline)]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Models.ApiV10.IMicrosoftGraphUser]
        # user input object
        ${InputObject},

        [Parameter()]
        [System.Boolean]
        [Alias('EnableAccount')]
        # true for enabling the account; otherwise, false.
        ${AccountEnabled},
        
        [Parameter()]
        [SecureString]
        # Password for the user. It must meet the tenant's password complexity requirements. It is recommended to set a strong password.
        ${Password},

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        # It must be specified if the user must change the password on the next successful login (true). Default behavior is (false) to not change the password on the next successful login.
        ${ForceChangePasswordNextLogin},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # Sets the age group of the user.
        # Allowed values: null, minor, notAdult and adult.
        # Refer to the legal age group property definitions for further information.
        # Supports $filter (eq, ne, NOT, and in).
        ${AgeGroup},
        
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The city in which the user is located.
        # Maximum length is 128 characters.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${City},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The company name which the user is associated.
        # This property can be useful for describing the company that an external user comes from.
        # The maximum length of the company name is 64 characters.Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${CompanyName},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # Sets whether consent has been obtained for minors.
        # Allowed values: null, granted, denied and notRequired.
        # Refer to the legal age group property definitions for further information.
        # Supports $filter (eq, ne, NOT, and in).
        ${ConsentProvidedForMinor},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The country/region in which the user is located; for example, US or UK.
        # Maximum length is 128 characters.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${Country},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.DateTime]
        # .
        ${DeletedDateTime},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The name for the department in which the user works.
        # Maximum length is 64 characters.Supports $filter (eq, ne, NOT , ge, le, and in operators).
        ${Department},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The name displayed in the address book for the user.
        # This value is usually the combination of the user's first name, middle initial, and last name.
        # This property is required when a user is created and it cannot be cleared during updates.
        # Maximum length is 256 characters.
        # Supports $filter (eq, ne, NOT , ge, le, in, startsWith), $orderBy, and $search.
        ${DisplayName},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.DateTime]
        # The date and time when the user was hired or will start work in case of a future hire.
        # Supports $filter (eq, ne, NOT , ge, le, in).
        ${EmployeeHireDate},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The employee identifier assigned to the user by the organization.
        # Supports $filter (eq, ne, NOT , ge, le, in, startsWith).
        ${EmployeeId},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # Captures enterprise worker type.
        # For example, Employee, Contractor, Consultant, or Vendor.
        # Supports $filter (eq, ne, NOT , ge, le, in, startsWith).
        ${EmployeeType},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # For an external user invited to the tenant using the invitation API, this property represents the invited user's invitation status.
        # For invited users, the state can be PendingAcceptance or Accepted, or null for all other users.
        # Supports $filter (eq, ne, NOT , in).
        ${ExternalUserState},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.DateTime]
        # Shows the timestamp for the latest change to the externalUserState property.
        # Supports $filter (eq, ne, NOT , in).
        ${ExternalUserStateChangeDateTime},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The fax number of the user.
        # Supports $filter (eq, ne, NOT , ge, le, in, startsWith).
        ${FaxNumber},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The given name (first name) of the user.
        # Maximum length is 64 characters.
        # Supports $filter (eq, ne, NOT , ge, le, in, startsWith).
        ${GivenName},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # Read-only.
        ${Id},
    
        [Parameter()]
        [AllowEmptyCollection()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Models.ApiV10.IMicrosoftGraphObjectIdentity[]]
        # Represents the identities that can be used to sign in to this user account.
        # An identity can be provided by Microsoft (also known as a local account), by organizations, or by social identity providers such as Facebook, Google, and Microsoft, and tied to a user account.
        # May contain multiple items with the same signInType value.
        # Supports $filter (eq) only where the signInType is not userPrincipalName.
        # To construct, see NOTES section for IDENTITY properties and create a hash table.
        ${Identity},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.Management.Automation.SwitchParameter]
        # Do not use – reserved for future use.
        ${IsResourceAccount},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The user's job title.
        # Maximum length is 128 characters.
        # Supports $filter (eq, ne, NOT , ge, le, in, startsWith).
        ${JobTitle},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The SMTP address for the user, for example, admin@contoso.com.
        # Changes to this property will also update the user's proxyAddresses collection to include the value as an SMTP address.
        # While this property can contain accent characters, using them can cause access issues with other Microsoft applications for the user.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith, endsWith).
        ${Mail},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The mail alias for the user.
        # This property must be specified when a user is created.
        # Maximum length is 64 characters.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${MailNickname},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The office location in the user's place of business.
        # Maximum length is 128 characters.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${OfficeLocation},

        [Parameter()]
        [System.String]
        # This property is used to associate an on-premises Active Directory user account to their Azure AD user object.
        # This property must be specified when creating a new user account in the Graph if you are using a federated domain for the user's userPrincipalName (UPN) property.
        # NOTE: The $ and _ characters cannot be used when specifying this property.
        # Returned only on $select.
        # Supports $filter (eq, ne, NOT, ge, le, in)..
        ${OnPremisesImmutableId},
    
        [Parameter()]
        [AllowEmptyCollection()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String[]]
        # A list of additional email addresses for the user; for example: ['bob@contoso.com', 'Robert@fabrikam.com'].NOTE: While this property can contain accent characters, they can cause access issues to first-party applications for the user.Supports $filter (eq, NOT, ge, le, in, startsWith).
        ${OtherMail},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # Specifies password policies for the user.
        # This value is an enumeration with one possible value being DisableStrongPassword, which allows weaker passwords than the default policy to be specified.
        # DisablePasswordExpiration can also be specified.
        # The two may be specified together; for example: DisablePasswordExpiration, DisableStrongPassword.Supports $filter (ne, NOT).
        ${PasswordPolicy},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Models.ApiV10.IMicrosoftGraphPasswordProfile]
        # passwordProfile
        # To construct, see NOTES section for PASSWORDPROFILE properties and create a hash table.
        ${PasswordProfile},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The postal code for the user's postal address.
        # The postal code is specific to the user's country/region.
        # In the United States of America, this attribute contains the ZIP code.
        # Maximum length is 40 characters.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${PostalCode},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The preferred language for the user.
        # Should follow ISO 639-1 Code; for example en-US.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${PreferredLanguage},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.Management.Automation.SwitchParameter]
        # true if the Outlook global address list should contain this user, otherwise false.
        # If not set, this will be treated as true.
        # For users invited through the invitation manager, this property will be set to false.
        # Supports $filter (eq, ne, NOT, in).
        ${ShowInAddressList},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The state or province in the user's address.
        # Maximum length is 128 characters.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${State},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The street address of the user's place of business.
        # Maximum length is 1024 characters.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${StreetAddress},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # The user's surname (family name or last name).
        # Maximum length is 64 characters.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${Surname},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # A two letter country code (ISO standard 3166).
        # Required for users that will be assigned licenses due to legal requirement to check for availability of services in countries.
        # Examples include: US, JP, and GB.
        # Not nullable.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith).
        ${UsageLocation},
    
        [Parameter(ParameterSetName='UPNParameterSet', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        [Alias("UPN")]
        # The user principal name (UPN) of the user.
        # The UPN is an Internet-style login name for the user based on the Internet standard RFC 822.
        # By convention, this should map to the user's email name.
        # The general format is alias@domain, where domain must be present in the tenant's collection of verified domains.
        # This property is required when a user is created.
        # The verified domains for the tenant can be accessed from the verifiedDomains property of organization.NOTE: While this property can contain accent characters, they can cause access issues to first-party applications for the user.
        # Supports $filter (eq, ne, NOT, ge, le, in, startsWith, endsWith) and $orderBy.
        ${UserPrincipalName},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Body')]
        [System.String]
        # A string value that can be used to classify user types in your directory, such as Member and Guest.
        # Supports $filter (eq, ne, NOT, in,).
        ${UserType},
    
        [Parameter()]
        [Alias("AzContext", "AzureRmContext", "AzureCredential")]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Azure')]
        [System.Management.Automation.PSObject]
        # The credentials, account, tenant, and subscription used for communication with Azure.
        ${DefaultProfile},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Wait for .NET debugger to attach
        ${Break},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be appended to the front of the pipeline
        ${HttpPipelineAppend},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be prepended to the front of the pipeline
        ${HttpPipelinePrepend},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Returns true when the command succeeds
        ${PassThru},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Runtime')]
        [System.Uri]
        # The URI for the proxy server to use
        ${Proxy},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Runtime')]
        [System.Management.Automation.PSCredential]
        # Credentials for a proxy server to use for the remote call
        ${ProxyCredential},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Use the default credentials for the proxy
        ${ProxyUseDefaultCredentials}
    )
    
    process {
            switch ($PSCmdlet.ParameterSetName) {
            'ObjectIdParameterSet' {
                $id = $PSBoundParameters['ObjectId']
                $null = $PSBoundParameters.Remove('ObjectId')
                break
            }
            'InputObjectParameterSet' {
                $id = $PSBoundParameters['InputObject'].Id
                $null = $PSBoundParameters.Remove('InputObject')
                break
            }
            'UPNOrObjectIdParameterSet' {
                $id = $PSBoundParameters['UPNOrObjectId']
                $null = $PSBoundParameters.Remove('UPNOrObjectId')
                break
            }
            'UPNParameterSet' {
              $id = $PSBoundParameters['UserPrincipalName']
              $null = $PSBoundParameters.Remove('UserPrincipalName')
              break
          }
      }
      if ($PSBoundParameters.ContainsKey('Password')) {
        $passwordProfile = [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Models.ApiV10.MicrosoftGraphPasswordProfile]::New()
        $passwordProfile.ForceChangePasswordNextSignIn = $ForceChangePasswordNextLogin
        $passwordProfile.Password = . "$PSScriptRoot/../utils/Unprotect-SecureString.ps1" $PSBoundParameters['Password']
        $null = $PSBoundParameters.Remove('Password')
        $null = $PSBoundParameters.Remove('ForceChangePasswordNextLogin')
        $PSBoundParameters['AccountEnabled'] = $true
        $PSBoundParameters['PasswordProfile'] = $passwordProfile
      }
      $PSBoundParameters['Id'] = $id

      Az.MSGraph.internal\Update-AzADUser @PSBoundParameters
    }
}
    
# SIG # Begin signature block
# MIInsQYJKoZIhvcNAQcCoIInojCCJ54CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDw0znhAtY07z+5
# Na2lA12chDpoZWIgbLPy3aD0wNuEGqCCDYUwggYDMIID66ADAgECAhMzAAACzfNk
# v/jUTF1RAAAAAALNMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjIwNTEyMjA0NjAyWhcNMjMwNTExMjA0NjAyWjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQDrIzsY62MmKrzergm7Ucnu+DuSHdgzRZVCIGi9CalFrhwtiK+3FIDzlOYbs/zz
# HwuLC3hir55wVgHoaC4liQwQ60wVyR17EZPa4BQ28C5ARlxqftdp3H8RrXWbVyvQ
# aUnBQVZM73XDyGV1oUPZGHGWtgdqtBUd60VjnFPICSf8pnFiit6hvSxH5IVWI0iO
# nfqdXYoPWUtVUMmVqW1yBX0NtbQlSHIU6hlPvo9/uqKvkjFUFA2LbC9AWQbJmH+1
# uM0l4nDSKfCqccvdI5l3zjEk9yUSUmh1IQhDFn+5SL2JmnCF0jZEZ4f5HE7ykDP+
# oiA3Q+fhKCseg+0aEHi+DRPZAgMBAAGjggGCMIIBfjAfBgNVHSUEGDAWBgorBgEE
# AYI3TAgBBggrBgEFBQcDAzAdBgNVHQ4EFgQU0WymH4CP7s1+yQktEwbcLQuR9Zww
# VAYDVR0RBE0wS6RJMEcxLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJh
# dGlvbnMgTGltaXRlZDEWMBQGA1UEBRMNMjMwMDEyKzQ3MDUzMDAfBgNVHSMEGDAW
# gBRIbmTlUAXTgqoXNzcitW2oynUClTBUBgNVHR8ETTBLMEmgR6BFhkNodHRwOi8v
# d3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9NaWNDb2RTaWdQQ0EyMDExXzIw
# MTEtMDctMDguY3JsMGEGCCsGAQUFBwEBBFUwUzBRBggrBgEFBQcwAoZFaHR0cDov
# L3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNDb2RTaWdQQ0EyMDEx
# XzIwMTEtMDctMDguY3J0MAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQELBQADggIB
# AE7LSuuNObCBWYuttxJAgilXJ92GpyV/fTiyXHZ/9LbzXs/MfKnPwRydlmA2ak0r
# GWLDFh89zAWHFI8t9JLwpd/VRoVE3+WyzTIskdbBnHbf1yjo/+0tpHlnroFJdcDS
# MIsH+T7z3ClY+6WnjSTetpg1Y/pLOLXZpZjYeXQiFwo9G5lzUcSd8YVQNPQAGICl
# 2JRSaCNlzAdIFCF5PNKoXbJtEqDcPZ8oDrM9KdO7TqUE5VqeBe6DggY1sZYnQD+/
# LWlz5D0wCriNgGQ/TWWexMwwnEqlIwfkIcNFxo0QND/6Ya9DTAUykk2SKGSPt0kL
# tHxNEn2GJvcNtfohVY/b0tuyF05eXE3cdtYZbeGoU1xQixPZAlTdtLmeFNly82uB
# VbybAZ4Ut18F//UrugVQ9UUdK1uYmc+2SdRQQCccKwXGOuYgZ1ULW2u5PyfWxzo4
# BR++53OB/tZXQpz4OkgBZeqs9YaYLFfKRlQHVtmQghFHzB5v/WFonxDVlvPxy2go
# a0u9Z+ZlIpvooZRvm6OtXxdAjMBcWBAsnBRr/Oj5s356EDdf2l/sLwLFYE61t+ME
# iNYdy0pXL6gN3DxTVf2qjJxXFkFfjjTisndudHsguEMk8mEtnvwo9fOSKT6oRHhM
# 9sZ4HTg/TTMjUljmN3mBYWAWI5ExdC1inuog0xrKmOWVMIIHejCCBWKgAwIBAgIK
# YQ6Q0gAAAAAAAzANBgkqhkiG9w0BAQsFADCBiDELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFJvb3QgQ2VydGlm
# aWNhdGUgQXV0aG9yaXR5IDIwMTEwHhcNMTEwNzA4MjA1OTA5WhcNMjYwNzA4MjEw
# OTA5WjB+MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSgwJgYD
# VQQDEx9NaWNyb3NvZnQgQ29kZSBTaWduaW5nIFBDQSAyMDExMIICIjANBgkqhkiG
# 9w0BAQEFAAOCAg8AMIICCgKCAgEAq/D6chAcLq3YbqqCEE00uvK2WCGfQhsqa+la
# UKq4BjgaBEm6f8MMHt03a8YS2AvwOMKZBrDIOdUBFDFC04kNeWSHfpRgJGyvnkmc
# 6Whe0t+bU7IKLMOv2akrrnoJr9eWWcpgGgXpZnboMlImEi/nqwhQz7NEt13YxC4D
# dato88tt8zpcoRb0RrrgOGSsbmQ1eKagYw8t00CT+OPeBw3VXHmlSSnnDb6gE3e+
# lD3v++MrWhAfTVYoonpy4BI6t0le2O3tQ5GD2Xuye4Yb2T6xjF3oiU+EGvKhL1nk
# kDstrjNYxbc+/jLTswM9sbKvkjh+0p2ALPVOVpEhNSXDOW5kf1O6nA+tGSOEy/S6
# A4aN91/w0FK/jJSHvMAhdCVfGCi2zCcoOCWYOUo2z3yxkq4cI6epZuxhH2rhKEmd
# X4jiJV3TIUs+UsS1Vz8kA/DRelsv1SPjcF0PUUZ3s/gA4bysAoJf28AVs70b1FVL
# 5zmhD+kjSbwYuER8ReTBw3J64HLnJN+/RpnF78IcV9uDjexNSTCnq47f7Fufr/zd
# sGbiwZeBe+3W7UvnSSmnEyimp31ngOaKYnhfsi+E11ecXL93KCjx7W3DKI8sj0A3
# T8HhhUSJxAlMxdSlQy90lfdu+HggWCwTXWCVmj5PM4TasIgX3p5O9JawvEagbJjS
# 4NaIjAsCAwEAAaOCAe0wggHpMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBRI
# bmTlUAXTgqoXNzcitW2oynUClTAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTAL
# BgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBRyLToCMZBD
# uRQFTuHqp8cx0SOJNDBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3JsLm1pY3Jv
# c29mdC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFf
# MDNfMjIuY3JsMF4GCCsGAQUFBwEBBFIwUDBOBggrBgEFBQcwAoZCaHR0cDovL3d3
# dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFf
# MDNfMjIuY3J0MIGfBgNVHSAEgZcwgZQwgZEGCSsGAQQBgjcuAzCBgzA/BggrBgEF
# BQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9kb2NzL3ByaW1h
# cnljcHMuaHRtMEAGCCsGAQUFBwICMDQeMiAdAEwAZQBnAGEAbABfAHAAbwBsAGkA
# YwB5AF8AcwB0AGEAdABlAG0AZQBuAHQALiAdMA0GCSqGSIb3DQEBCwUAA4ICAQBn
# 8oalmOBUeRou09h0ZyKbC5YR4WOSmUKWfdJ5DJDBZV8uLD74w3LRbYP+vj/oCso7
# v0epo/Np22O/IjWll11lhJB9i0ZQVdgMknzSGksc8zxCi1LQsP1r4z4HLimb5j0b
# pdS1HXeUOeLpZMlEPXh6I/MTfaaQdION9MsmAkYqwooQu6SpBQyb7Wj6aC6VoCo/
# KmtYSWMfCWluWpiW5IP0wI/zRive/DvQvTXvbiWu5a8n7dDd8w6vmSiXmE0OPQvy
# CInWH8MyGOLwxS3OW560STkKxgrCxq2u5bLZ2xWIUUVYODJxJxp/sfQn+N4sOiBp
# mLJZiWhub6e3dMNABQamASooPoI/E01mC8CzTfXhj38cbxV9Rad25UAqZaPDXVJi
# hsMdYzaXht/a8/jyFqGaJ+HNpZfQ7l1jQeNbB5yHPgZ3BtEGsXUfFL5hYbXw3MYb
# BL7fQccOKO7eZS/sl/ahXJbYANahRr1Z85elCUtIEJmAH9AAKcWxm6U/RXceNcbS
# oqKfenoi+kiVH6v7RyOA9Z74v2u3S5fi63V4GuzqN5l5GEv/1rMjaHXmr/r8i+sL
# gOppO6/8MO0ETI7f33VtY5E90Z1WTk+/gFcioXgRMiF670EKsT/7qMykXcGhiJtX
# cVZOSEXAQsmbdlsKgEhr/Xmfwb1tbWrJUnMTDXpQzTGCGYIwghl+AgEBMIGVMH4x
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01p
# Y3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTECEzMAAALN82S/+NRMXVEAAAAA
# As0wDQYJYIZIAWUDBAIBBQCgga4wGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQw
# HAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIIxm
# +SMhHjfO4ydzOsn4FiRoYq901i+Vhc/qaH9xwS+zMEIGCisGAQQBgjcCAQwxNDAy
# oBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20wDQYJKoZIhvcNAQEBBQAEggEAL5LYYzc+6jjeyWxlCtFw3wj+bb6hxcNf7Tfb
# Y9ONH7yWGhj0lBFe5WO25NHUGgoaqtiXE51mq9s6XpwMVcpJa25KaubsVnMYCZbq
# OU8mVLCZfsfNwDv+mOeBPftTL1g5H94fNSNDzTDsgcq0jso6AtnC+HY3WZW985iE
# VZNr8pqmguNHzCfWQnsySgGM4fxqiVmkgbpaAdGS7hvjbkc7YB2KaRtupHfj0PwT
# tr+8EDR6uZD9NyBHfPQyRKAyCliRf0JsJgWioMbvoZY4tOGoF+T4LMO8J14VFPGn
# YcehdfRyRWk1kYDfgPz903tnvzPkq33pjIyLKCYnkuitbQ5RgKGCFwwwghcIBgor
# BgEEAYI3AwMBMYIW+DCCFvQGCSqGSIb3DQEHAqCCFuUwghbhAgEDMQ8wDQYJYIZI
# AWUDBAIBBQAwggFVBgsqhkiG9w0BCRABBKCCAUQEggFAMIIBPAIBAQYKKwYBBAGE
# WQoDATAxMA0GCWCGSAFlAwQCAQUABCC78Kq3N61qlzWus47xPoppt0u784/wi7bk
# rqmwJOZdKwIGYtreAijTGBMyMDIyMDcyNzEwMTcxOC44OThaMASAAgH0oIHUpIHR
# MIHOMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
# UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSkwJwYDVQQL
# EyBNaWNyb3NvZnQgT3BlcmF0aW9ucyBQdWVydG8gUmljbzEmMCQGA1UECxMdVGhh
# bGVzIFRTUyBFU046NjBCQy1FMzgzLTI2MzUxJTAjBgNVBAMTHE1pY3Jvc29mdCBU
# aW1lLVN0YW1wIFNlcnZpY2WgghFfMIIHEDCCBPigAwIBAgITMwAAAaZZRYM5TZ7r
# SwABAAABpjANBgkqhkiG9w0BAQsFADB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMK
# V2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
# IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0Eg
# MjAxMDAeFw0yMjAzMDIxODUxMjFaFw0yMzA1MTExODUxMjFaMIHOMQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSkwJwYDVQQLEyBNaWNyb3NvZnQg
# T3BlcmF0aW9ucyBQdWVydG8gUmljbzEmMCQGA1UECxMdVGhhbGVzIFRTUyBFU046
# NjBCQy1FMzgzLTI2MzUxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNl
# cnZpY2UwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDZmL97UiPnyfzU
# CZ48+ybwp3Pl5tKyqHvWCg+DLzGArpe3oHa0/87+bxW0IIzUO+Ou9nzcHms7ZEeu
# VfMtvbuTy9rH9NafrnIXtGbuLUooPhrEOmUJfbYz0QGP9yEwRw3iGMr6vFp3vfuz
# aDy4cQ0junbV+2ArkOM3Ez90hOjLweG+TYoIXbb6GVWmJNZV6Y1E33ZiqF9QAatb
# CW1C0p0otEHeL75d5mfY8cL/XUf55WT+tpa2WGauyz7Rw+gZZnJQeT0/PQ50ptbI
# 2mZxR6yszrJquRpZi+UhboAgmTqCs9d9xSXkGhTHFwWUgkIzQAVgWxyEQhNcrBxx
# vNw3aJ0ZpwvBDpWHkcE1s/0As+qtK4jiG2MgvwNgYFBKbvf/RMpq07MjK9v80vBn
# RMm0OVu39Fq3K5igf2OtvoOk5nzkvDbVPi9YxqCjRukOUZXycGbvCf0PXZeDschy
# rsu/PsJuh7Be7gIs6bFoet1FGqCvzhkIgRtzSfpHn+XlqZ72uGSX4QJ6mEwGQ9bh
# 4H/FX0I55dAQdmF8yvVmk6nXvHfvKgsVSq+YSWL2zvl9/tpOTwoq1Cv0m6K3l/sV
# IVWkBIVQ2KpWrcj7bSO2diK5ITM8Bb3PqdEHsjIjZqNnAWXo8fInAznFIncMpg1G
# KhjxOzAPL7Slt33nkkmCbAhJLlDv7wIDAQABo4IBNjCCATIwHQYDVR0OBBYEFDpU
# ITv8xpaivfVJDS/xrvwK8jfYMB8GA1UdIwQYMBaAFJ+nFV0AXmJdg/Tl0mWnG1M1
# GelyMF8GA1UdHwRYMFYwVKBSoFCGTmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9w
# a2lvcHMvY3JsL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEp
# LmNybDBsBggrBgEFBQcBAQRgMF4wXAYIKwYBBQUHMAKGUGh0dHA6Ly93d3cubWlj
# cm9zb2Z0LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUy
# MFBDQSUyMDIwMTAoMSkuY3J0MAwGA1UdEwEB/wQCMAAwEwYDVR0lBAwwCgYIKwYB
# BQUHAwgwDQYJKoZIhvcNAQELBQADggIBAIDA8Vg06Rqi5xaD4Zv4g38BxhfMa9jW
# 6yZfHoBINk4UybE39MARPmULJ2H60ZlwW3urAly1Te9Kj7iPjhGzeTDmouwbntf+
# I+VU5Fqrh+RmXlWrdjfnQ+5UlFqdHVPI/rgYQS+RhUpqA1VZvs1thkdo7jyNb9ue
# ACU29peOfGp5ZCYxr5mJ9gbUUtd4f8A0e4a0GiOwYHch1gFefhxI+VIayK677cCY
# or0mlBAN6iumSv62SEL/7jkQ5DjcPtqRxyBNUl5v1iJYa1UthyKIH69yY6r2YqJ+
# iyUg++NY/MVQy4gpcAG7KR6FRY8bcQXDI6j8emlgiUvL40qE54ZFeDzueZqrDO0P
# F0ERkIQO8OMzUDibvZA+MRXWKT1Jizf3WiHBBJaHwYxs/rBHdQeMqqiJN7thuFco
# E1xZrYS/HIUqO6/hiL06lioUgP7Gp0uDd4woAgntxU0ibKeIOZ8Gry71gLc3DiL0
# kaKxpgHjdJtsIMwSveU/6oKxhg10qLNSTQ1kVQZz9KrMNUKKuRtA/Icb0D7N1+Ny
# gb9RiZdMKOa3AvvTjFsSZQet4LU6ELANQhK2KGCzGbVMyS++I8GZP4K6RxEISIQd
# 7J3gvMMxiibn7e2Dvx1gqbsHQoSI8p05wYfshRjHYN8EayGznMP4ipl2aKTE0DDn
# JiHiMCQHswOwMIIHcTCCBVmgAwIBAgITMwAAABXF52ueAptJmQAAAAAAFTANBgkq
# hkiG9w0BAQsFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24x
# EDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlv
# bjEyMDAGA1UEAxMpTWljcm9zb2Z0IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5
# IDIwMTAwHhcNMjEwOTMwMTgyMjI1WhcNMzAwOTMwMTgzMjI1WjB8MQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQg
# VGltZS1TdGFtcCBQQ0EgMjAxMDCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoC
# ggIBAOThpkzntHIhC3miy9ckeb0O1YLT/e6cBwfSqWxOdcjKNVf2AX9sSuDivbk+
# F2Az/1xPx2b3lVNxWuJ+Slr+uDZnhUYjDLWNE893MsAQGOhgfWpSg0S3po5GawcU
# 88V29YZQ3MFEyHFcUTE3oAo4bo3t1w/YJlN8OWECesSq/XJprx2rrPY2vjUmZNqY
# O7oaezOtgFt+jBAcnVL+tuhiJdxqD89d9P6OU8/W7IVWTe/dvI2k45GPsjksUZzp
# cGkNyjYtcI4xyDUoveO0hyTD4MmPfrVUj9z6BVWYbWg7mka97aSueik3rMvrg0Xn
# Rm7KMtXAhjBcTyziYrLNueKNiOSWrAFKu75xqRdbZ2De+JKRHh09/SDPc31BmkZ1
# zcRfNN0Sidb9pSB9fvzZnkXftnIv231fgLrbqn427DZM9ituqBJR6L8FA6PRc6ZN
# N3SUHDSCD/AQ8rdHGO2n6Jl8P0zbr17C89XYcz1DTsEzOUyOArxCaC4Q6oRRRuLR
# vWoYWmEBc8pnol7XKHYC4jMYctenIPDC+hIK12NvDMk2ZItboKaDIV1fMHSRlJTY
# uVD5C4lh8zYGNRiER9vcG9H9stQcxWv2XFJRXRLbJbqvUAV6bMURHXLvjflSxIUX
# k8A8FdsaN8cIFRg/eKtFtvUeh17aj54WcmnGrnu3tz5q4i6tAgMBAAGjggHdMIIB
# 2TASBgkrBgEEAYI3FQEEBQIDAQABMCMGCSsGAQQBgjcVAgQWBBQqp1L+ZMSavoKR
# PEY1Kc8Q/y8E7jAdBgNVHQ4EFgQUn6cVXQBeYl2D9OXSZacbUzUZ6XIwXAYDVR0g
# BFUwUzBRBgwrBgEEAYI3TIN9AQEwQTA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5t
# aWNyb3NvZnQuY29tL3BraW9wcy9Eb2NzL1JlcG9zaXRvcnkuaHRtMBMGA1UdJQQM
# MAoGCCsGAQUFBwMIMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMAsGA1UdDwQE
# AwIBhjAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQYMBaAFNX2VsuP6KJcYmjRPZSQ
# W9fOmhjEMFYGA1UdHwRPME0wS6BJoEeGRWh0dHA6Ly9jcmwubWljcm9zb2Z0LmNv
# bS9wa2kvY3JsL3Byb2R1Y3RzL01pY1Jvb0NlckF1dF8yMDEwLTA2LTIzLmNybDBa
# BggrBgEFBQcBAQROMEwwSgYIKwYBBQUHMAKGPmh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2kvY2VydHMvTWljUm9vQ2VyQXV0XzIwMTAtMDYtMjMuY3J0MA0GCSqG
# SIb3DQEBCwUAA4ICAQCdVX38Kq3hLB9nATEkW+Geckv8qW/qXBS2Pk5HZHixBpOX
# PTEztTnXwnE2P9pkbHzQdTltuw8x5MKP+2zRoZQYIu7pZmc6U03dmLq2HnjYNi6c
# qYJWAAOwBb6J6Gngugnue99qb74py27YP0h1AdkY3m2CDPVtI1TkeFN1JFe53Z/z
# jj3G82jfZfakVqr3lbYoVSfQJL1AoL8ZthISEV09J+BAljis9/kpicO8F7BUhUKz
# /AyeixmJ5/ALaoHCgRlCGVJ1ijbCHcNhcy4sa3tuPywJeBTpkbKpW99Jo3QMvOyR
# gNI95ko+ZjtPu4b6MhrZlvSP9pEB9s7GdP32THJvEKt1MMU0sHrYUP4KWN1APMdU
# bZ1jdEgssU5HLcEUBHG/ZPkkvnNtyo4JvbMBV0lUZNlz138eW0QBjloZkWsNn6Qo
# 3GcZKCS6OEuabvshVGtqRRFHqfG3rsjoiV5PndLQTHa1V1QJsWkBRH58oWFsc/4K
# u+xBZj1p/cvBQUl+fpO+y/g75LcVv7TOPqUxUYS8vwLBgqJ7Fx0ViY1w/ue10Cga
# iQuPNtq6TPmb/wrpNPgkNWcr4A245oyZ1uEi6vAnQj0llOZ0dFtq0Z4+7X6gMTN9
# vMvpe784cETRkPHIqzqKOghif9lwY1NNje6CbaUFEMFxBmoQtB1VM1izoXBm8qGC
# AtIwggI7AgEBMIH8oYHUpIHRMIHOMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMSkwJwYDVQQLEyBNaWNyb3NvZnQgT3BlcmF0aW9ucyBQdWVydG8g
# UmljbzEmMCQGA1UECxMdVGhhbGVzIFRTUyBFU046NjBCQy1FMzgzLTI2MzUxJTAj
# BgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2WiIwoBATAHBgUrDgMC
# GgMVAGp0M62VvUwfd1Xuz2uFD2qNn3ytoIGDMIGApH4wfDELMAkGA1UEBhMCVVMx
# EzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoT
# FU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUt
# U3RhbXAgUENBIDIwMTAwDQYJKoZIhvcNAQEFBQACBQDmi0seMCIYDzIwMjIwNzI3
# MDkyNjU0WhgPMjAyMjA3MjgwOTI2NTRaMHcwPQYKKwYBBAGEWQoEATEvMC0wCgIF
# AOaLSx4CAQAwCgIBAAICIugCAf8wBwIBAAICElQwCgIFAOaMnJ4CAQAwNgYKKwYB
# BAGEWQoEAjEoMCYwDAYKKwYBBAGEWQoDAqAKMAgCAQACAwehIKEKMAgCAQACAwGG
# oDANBgkqhkiG9w0BAQUFAAOBgQCh6lyYXv2yJipXt4TldpTaGD8apE6gEWE3I1r/
# ogPjVn2iPJj8X4L01LPJJcKO5I0N3z2KYFQY66skcy6zuIi23hEe++RhYzDzSFfd
# Pp/2ZTGHRpufDMzesaN7bHnQF9vZEtAsH4u4ulKdrw1ZFqQJXrGDxB3WoIVACrsg
# HuKFKjGCBA0wggQJAgEBMIGTMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNo
# aW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29y
# cG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEw
# AhMzAAABpllFgzlNnutLAAEAAAGmMA0GCWCGSAFlAwQCAQUAoIIBSjAaBgkqhkiG
# 9w0BCQMxDQYLKoZIhvcNAQkQAQQwLwYJKoZIhvcNAQkEMSIEIFSuh2wk7oqaEVq0
# IISfwsu5oCiDSkwuMtgMBOn5/G6VMIH6BgsqhkiG9w0BCRACLzGB6jCB5zCB5DCB
# vQQggwsZi8M/dH1r4TCmyUwEGirdw6F3ogIX6fEw/bYEqw0wgZgwgYCkfjB8MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNy
# b3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAaZZRYM5TZ7rSwABAAABpjAi
# BCCzboc3Ljp7U34DYxMMmD0VU8XHBISxF6gv1RDo33TM0jANBgkqhkiG9w0BAQsF
# AASCAgCg9j+jkOTgfjWUrIbEcFBZQvfKRKi4pvEbgvJvnTRcyotm9xFzciWjIYHr
# oYk2xrS+HSyKpH76JPsQJ6KWYAqJfyhvGdD454sIeKCwNrWuEM/x6MHavps/ulA3
# kAnGDeQzucH+AhXFF7qC1g3GUi+voPSE2BeWh0LtDksj6ztsOrIHJG96Qf5j36/a
# IgdYzM7NGz4FZl8lD7BSkSYxued7VlzpqkhYNqTl6ypjQR2JD3/C2WLu5OGxrkay
# 8BIV/b3IFU/lmq+fGLvFRi3VFMnZ8QCn4GgQVS7vtvIuWrwdssIHc+C2KaTrk3Va
# FC9PKaAQV4KtFzlT6l6Cv4irTCyu5XzHqCXy0QUhbWi1292bzCGDF2clu2R/WJcc
# Ajdsvpal5ImdWeYSJ4lCCQWVykdhw8JyfyIbBIAh9HYOwC+7DAWRekLRzo7rRVOQ
# x3/LGs0sUCBCg2Os3a7sUFQX+xyRqZjkOHhsAEFWx683JrkRUxEBlqIL+JH5IG/P
# waMseuI8K/a7KKsIfOCV/N2bvv3FH11c7Bjq2qbgAsUW2Xp96OyKiG+PYfXfIEEB
# hshMIXTHmcFa/RqvvAPd7V6d1wqRp+yd2wsJhgRXBPAgtptjnuZk9kmvx1s+RHto
# isGmWtprK4GYIxnaI//W100lUB84rTxJoDgleABhjXdK8H0i9A==
# SIG # End signature block
