##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class AddressContext < InstanceContext
            class DependentPhoneNumberList < ListResource
              ##
              # Initialize the DependentPhoneNumberList
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The SID of the
              #   {Account}[https://www.twilio.com/docs/iam/api/account] that created the
              #   DependentPhoneNumber resource.
              # @param [String] address_sid The unique string that that we created to identify
              #   the Address resource.
              # @return [DependentPhoneNumberList] DependentPhoneNumberList
              def initialize(version, account_sid: nil, address_sid: nil)
                super(version)

                # Path Solution
                @solution = {account_sid: account_sid, address_sid: address_sid}
                @uri = "/Accounts/#{@solution[:account_sid]}/Addresses/#{@solution[:address_sid]}/DependentPhoneNumbers.json"
              end

              ##
              # Lists DependentPhoneNumberInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records.  If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(limit: nil, page_size: nil)
                self.stream(limit: limit, page_size: page_size).entries
              end

              ##
              # Streams DependentPhoneNumberInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit. Default is no limit.
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records. If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)

                page = self.page(page_size: limits[:page_size], )

                @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
              end

              ##
              # When passed a block, yields DependentPhoneNumberInstance records from the API.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              def each
                limits = @version.read_limits

                page = self.page(page_size: limits[:page_size], )

                @version.stream(page,
                                limit: limits[:limit],
                                page_limit: limits[:page_limit]).each {|x| yield x}
              end

              ##
              # Retrieve a single page of DependentPhoneNumberInstance records from the API.
              # Request is executed immediately.
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of DependentPhoneNumberInstance
              def page(page_token: :unset, page_number: :unset, page_size: :unset)
                params = Twilio::Values.of({
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })

                response = @version.page('GET', @uri, params: params)

                DependentPhoneNumberPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of DependentPhoneNumberInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of DependentPhoneNumberInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                DependentPhoneNumberPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Api.V2010.DependentPhoneNumberList>'
              end
            end

            class DependentPhoneNumberPage < Page
              ##
              # Initialize the DependentPhoneNumberPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [DependentPhoneNumberPage] DependentPhoneNumberPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of DependentPhoneNumberInstance
              # @param [Hash] payload Payload response from the API
              # @return [DependentPhoneNumberInstance] DependentPhoneNumberInstance
              def get_instance(payload)
                DependentPhoneNumberInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    address_sid: @solution[:address_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Api.V2010.DependentPhoneNumberPage>'
              end
            end

            class DependentPhoneNumberInstance < InstanceResource
              ##
              # Initialize the DependentPhoneNumberInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] account_sid The SID of the
              #   {Account}[https://www.twilio.com/docs/iam/api/account] that created the
              #   DependentPhoneNumber resource.
              # @param [String] address_sid The unique string that that we created to identify
              #   the Address resource.
              # @return [DependentPhoneNumberInstance] DependentPhoneNumberInstance
              def initialize(version, payload, account_sid: nil, address_sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'sid' => payload['sid'],
                    'account_sid' => payload['account_sid'],
                    'friendly_name' => payload['friendly_name'],
                    'phone_number' => payload['phone_number'],
                    'voice_url' => payload['voice_url'],
                    'voice_method' => payload['voice_method'],
                    'voice_fallback_method' => payload['voice_fallback_method'],
                    'voice_fallback_url' => payload['voice_fallback_url'],
                    'voice_caller_id_lookup' => payload['voice_caller_id_lookup'],
                    'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                    'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                    'sms_fallback_method' => payload['sms_fallback_method'],
                    'sms_fallback_url' => payload['sms_fallback_url'],
                    'sms_method' => payload['sms_method'],
                    'sms_url' => payload['sms_url'],
                    'address_requirements' => payload['address_requirements'],
                    'capabilities' => payload['capabilities'],
                    'status_callback' => payload['status_callback'],
                    'status_callback_method' => payload['status_callback_method'],
                    'api_version' => payload['api_version'],
                    'sms_application_sid' => payload['sms_application_sid'],
                    'voice_application_sid' => payload['voice_application_sid'],
                    'trunk_sid' => payload['trunk_sid'],
                    'emergency_status' => payload['emergency_status'],
                    'emergency_address_sid' => payload['emergency_address_sid'],
                    'uri' => payload['uri'],
                }
              end

              ##
              # @return [String] The unique string that identifies the resource
              def sid
                @properties['sid']
              end

              ##
              # @return [String] The SID of the Account that created the resource
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] The string that you assigned to describe the resource
              def friendly_name
                @properties['friendly_name']
              end

              ##
              # @return [String] The phone number in E.164 format
              def phone_number
                @properties['phone_number']
              end

              ##
              # @return [String] The URL we call when the phone number receives a call
              def voice_url
                @properties['voice_url']
              end

              ##
              # @return [String] The HTTP method used with the voice_url
              def voice_method
                @properties['voice_method']
              end

              ##
              # @return [String] The HTTP method used with voice_fallback_url
              def voice_fallback_method
                @properties['voice_fallback_method']
              end

              ##
              # @return [String] The URL we call when an error occurs in TwiML
              def voice_fallback_url
                @properties['voice_fallback_url']
              end

              ##
              # @return [Boolean] Whether to lookup the caller's name
              def voice_caller_id_lookup
                @properties['voice_caller_id_lookup']
              end

              ##
              # @return [Time] The RFC 2822 date and time in GMT that the resource was created
              def date_created
                @properties['date_created']
              end

              ##
              # @return [Time] The RFC 2822 date and time in GMT that the resource was last updated
              def date_updated
                @properties['date_updated']
              end

              ##
              # @return [String] The HTTP method used with sms_fallback_url
              def sms_fallback_method
                @properties['sms_fallback_method']
              end

              ##
              # @return [String] The URL that we call when an error occurs while retrieving or executing the TwiML
              def sms_fallback_url
                @properties['sms_fallback_url']
              end

              ##
              # @return [String] The HTTP method to use with sms_url
              def sms_method
                @properties['sms_method']
              end

              ##
              # @return [String] The URL we call when the phone number receives an incoming SMS message
              def sms_url
                @properties['sms_url']
              end

              ##
              # @return [dependent_phone_number.AddressRequirement] Whether the phone number requires an Address registered with Twilio
              def address_requirements
                @properties['address_requirements']
              end

              ##
              # @return [Hash] Indicate if a phone can receive calls or messages
              def capabilities
                @properties['capabilities']
              end

              ##
              # @return [String] The URL to send status information to your application
              def status_callback
                @properties['status_callback']
              end

              ##
              # @return [String] The HTTP method we use to call status_callback
              def status_callback_method
                @properties['status_callback_method']
              end

              ##
              # @return [String] The API version used to start a new TwiML session
              def api_version
                @properties['api_version']
              end

              ##
              # @return [String] The SID of the application that handles SMS messages sent to the phone number
              def sms_application_sid
                @properties['sms_application_sid']
              end

              ##
              # @return [String] The SID of the application that handles calls to the phone number
              def voice_application_sid
                @properties['voice_application_sid']
              end

              ##
              # @return [String] The SID of the Trunk that handles calls to the phone number
              def trunk_sid
                @properties['trunk_sid']
              end

              ##
              # @return [dependent_phone_number.EmergencyStatus] Whether the phone number is enabled for emergency calling
              def emergency_status
                @properties['emergency_status']
              end

              ##
              # @return [String] The emergency address configuration to use for emergency calling
              def emergency_address_sid
                @properties['emergency_address_sid']
              end

              ##
              # @return [String] The URI of the resource, relative to `https://api.twilio.com`
              def uri
                @properties['uri']
              end

              ##
              # Provide a user friendly representation
              def to_s
                "<Twilio.Api.V2010.DependentPhoneNumberInstance>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                "<Twilio.Api.V2010.DependentPhoneNumberInstance>"
              end
            end
          end
        end
      end
    end
  end
end