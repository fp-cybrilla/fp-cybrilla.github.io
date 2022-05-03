## Video KYC
----------------

**Pre KYC checks**<br>
Please ensure the following have been completed for production access -
- Channel partner agreement with the partner AMC
- [HMAC Authentication](https://fintechprimitives.com/api/#hmac-token-generation) (for production only. Not required for sandbox environment)

**Step 1 -**<br>
  User inputs PAN into the distributor's application.

**Step 2 -**<br>
  [Check KYC status API](https://fintechprimitives.com/api/#post-create-kyc-check)<br>
  The test PANs are available [here](https://docs.fintechprimitives.com/pages/test_data)<br> 
  A background check for KYC status through PAN using CVL API is performed.<br>
  If the user in not KYC compliant, proceed to the next steps.<br>
  <i>Note</i> - The KRA allows access to this API for ARN holders only.
  

**Step 3 -**<br>
[File upload](https://fintechprimitives.com/api/#post-file-upload)<br>
The investor has to upload the following documents (mandatory by regulation) - 
  1. Proof of Identity (PAN)
  2. Proof of Address
    - Driving license/Passport/Voter ID/Aadhaar
    - Both images (front and back) of the document are required
  3. Photo (a selfie where face should be clearly visible)
  4. Signature (on a white background)
  5. Video
    - [Sample video](../../pages/workflows/video-kyc-faq?id=sample_video)
    - The investor has to speak their name and PAN number in the video (the audio has to be loud and clear else the request will be rejected)
    - The video has to be atleast 14 seconds long. 
    - The video has to be in .mp4 format with H.264 encoding (If the user submits in a different format, please convert the same into the required format before submission respectively)
    - The face of the investor has to be clearly visible
    - The video has to be captured within the app itself (the investor cannot record it using the camera app on the mobile phone or the webcam on a laptop and upload it later)    

**Step 4 - Create Video KYC request**<br>
[Create Video KYC request](https://fintechprimitives.com/api/#post-create-kyc-request)

**Step 5 - Create investment order**<br>
Create a minimum investment of &#8377;100 in any scheme of the partner AMC.

**Step 6 - Fetch status**<br>
[Check Video KYC status](https://fintechprimitives.com/api/#get-get-kyc-request)

**Step 7 - Update Video KYC request (if required)**<br>
[Update Video KYC request](https://fintechprimitives.com/api/#post-patch-update-kyc-request)

<!--
    - The investor has to say his name, then spell his name and then say his PAN number
    - The video can be in any standard format
    - The face of the investor has to be clearly visible
    - The video has to be captured within the app (the user cannot record it using the camera app on the mobile phone or the webcam on a laptop and then upload it later)
    -->

  <!--
    - The investor has to read out the OTP that they shall receive on the distributor's app, while holding their ID proof clearly in front of the camera.
    - The ID proof to be held has to be a government approved one (Driving license/Passport/Voter ID/Aadhaar/PAN)
-->
