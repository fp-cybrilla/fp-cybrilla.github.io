## Video KYC
----------------

**Step 1 -**<br>
  User inputs PAN

**Step 2 -**<br>
  [Check KYC status API](https://fintechprimitives.com/api/#post-create-kyc-check)<br>
  A background check for KYC status through PAN using CVL API is performed.<br>
  If the user in not KYC compliant, proceed to the next steps.

**Step 3 -**<br>
[File upload](https://fintechprimitives.com/api/#post-file-upload)<br>
The investor is required to submit the following mandatory documents - 
  1. Proof Of Identity (PAN)
  2. Proof of Address
    - Currently two are accepted - Driving license/Passport
    - Images of both front and back are required
  3. Photo (a selfie where face should be clearly visible)
  4. Video
    - [Sample video](../../pages/workflows/video-kyc-faq)
    - The investor has to say his name, then spell his name and then say his PAN number
    - The video can be in any standard format
    - The face of the investor has to be clearly visible
    - The video has to be captured within the app (the user cannot record it using the camera app on the mobile phone or the webcam on a laptop and then upload it later)
  5. Signature (on a white background)

**Step 4 - Create Video KYC request**<br>
[Create Video KYC request](https://fintechprimitives.com/api/#post-create-video-kyc-request)

**Step 5 - Fetch status**<br>
[Check Video KYC status](https://fintechprimitives.com/api/#get-get-video-kyc-request)

**Step 6 - Update Video KYC request (if it has been rejected)**<br>
[Update Video KYC request](https://fintechprimitives.com/api/#put-update-video-kyc-request)
