json.array!(@pairing_sessions) do |pairing_session|
  json.extract! pairing_session, :id, :complete
  json.url pairing_session_url(pairing_session, format: :json)
end
