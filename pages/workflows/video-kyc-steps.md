## Video KYC
----------------

**Step 1 -**<br>
  User inputs PAN into the distributor's application.

**Step 2 -**<br>
  [Check KYC status API](https://fintechprimitives.com/api/#post-create-kyc-check)<br>
  A background check for KYC status through PAN using CVL API is performed.<br>
  If the user in not KYC compliant, proceed to the next steps.

**Step 3 -**<br>
[File upload](https://fintechprimitives.com/api/#post-file-upload)<br>
The investor has to upload the following documents (mandatory by regulation) - 
  1. Proof of Identity (PAN)
  2. Proof of Address
    - Driving license/Passport/Voter ID/Aadhaar
    - Both images (front and back) of the document are required
  3. Photo (a selfie where face should be clearly visible)
  4. Video
    - [Sample video](../../pages/workflows/video-kyc-faq?id=sample_video)
    - The investor has to read out the OTP that they shall receive on the distributor's app, while holding their ID proof clearly in front of the camera.
    - The ID proof to be held has to be a government approved one (Driving license/Passport/Voter ID/Aadhaar/PAN)
    - The video can be in any standard format
    - The face of the investor has to be clearly visible
    - The video has to be captured within the app itself (the user cannot record it using the camera app on the mobile phone or the webcam on a laptop and upload it later)    
  5. Signature (on a white background)

**Step 4 - Create Video KYC request**<br>
[Create Video KYC request](https://fintechprimitives.com/api/#post-create-video-kyc-request)

**Step 5 - Fetch status**<br>
Create a minimum investment of &#8377;100 in any scheme of the partner AMC.

**Step 6 - Fetch status**<br>
[Check Video KYC status](https://fintechprimitives.com/api/#get-get-video-kyc-request)

**Step 7 - Update Video KYC request (if it has been rejected)**<br>
[Update Video KYC request](https://fintechprimitives.com/api/#put-update-video-kyc-request)

<!--
    - The investor has to say his name, then spell his name and then say his PAN number
    - The video can be in any standard format
    - The face of the investor has to be clearly visible
    - The video has to be captured within the app (the user cannot record it using the camera app on the mobile phone or the webcam on a laptop and then upload it later)
    -->