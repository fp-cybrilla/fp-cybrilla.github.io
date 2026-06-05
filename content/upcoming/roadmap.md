---
title: Product Roadmap
---

<style>
  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
  :root {
    --bg: #ffffff;
    --bg-subtle: #f8f9fb;
    --border: #e5e7eb;
    --border-strong: #d1d5db;
    --text: #111827;
    --text-secondary: #374151;
    --muted: #6b7280;
    --muted-light: #9ca3af;
    --consider-text: #92400e; --consider-bg: #fffbeb; --consider-border: #fde68a;
    --dev-text: #1e40af; --dev-bg: #eff6ff; --dev-border: #bfdbfe;
    --launched-text: #065f46; --launched-bg: #f0fdf4; --launched-border: #a7f3d0;
    --mar-text: #92400e; --mar-bg: #fef3c7; --mar-border: #fcd34d;
    --apr-text: #5b21b6; --apr-bg: #f5f3ff; --apr-border: #c4b5fd;
    --may-text: #065f46; --may-bg: #f0fdf4; --may-border: #6ee7b7;
    --jun-text: #0c4a6e; --jun-bg: #f0f9ff; --jun-border: #7dd3fc;
    --tbd-text: #6b7280; --tbd-bg: #f3f4f6; --tbd-border: #d1d5db;
    --accent: #2563eb; --accent-light: #eff6ff;
  }
  .rm-wrap { font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; line-height: 1.6; }
  .rm-header { margin-bottom: 32px; padding-bottom: 24px; border-bottom: 1px solid var(--border); }
  .rm-title { font-size: 28px; font-weight: 700; color: var(--text); letter-spacing: -0.02em; margin-bottom: 6px; }
  .rm-subtitle { font-size: 13px; color: var(--muted); }
  .rm-tabs { display: flex; gap: 0; border-bottom: 1px solid var(--border); margin-bottom: 28px; }
  .rm-tab { padding: 9px 20px; font-size: 13px; font-weight: 500; cursor: pointer; border: none; background: transparent; color: var(--muted); border-bottom: 2px solid transparent; margin-bottom: -1px; transition: color 0.15s, border-color 0.15s; font-family: inherit; }
  .rm-tab:hover { color: var(--text); }
  .rm-tab.active { color: var(--accent); border-bottom-color: var(--accent); font-weight: 600; }
  .rm-count { background: var(--border); color: var(--muted); font-size: 10px; font-weight: 600; padding: 1px 6px; border-radius: 10px; margin-left: 4px; }
  .rm-tab.active .rm-count { background: var(--accent-light); color: var(--accent); }
  .rm-board { display: grid; grid-template-columns: repeat(3, 1fr); gap: 16px; }
  .rm-column { display: flex; flex-direction: column; }
  .rm-column-header { display: flex; align-items: center; gap: 8px; padding: 10px 14px; border-radius: 6px 6px 0 0; font-size: 11.5px; font-weight: 600; letter-spacing: 0.06em; text-transform: uppercase; border: 1px solid; border-bottom: none; }
  .rm-col-consideration .rm-column-header { background: var(--consider-bg); color: var(--consider-text); border-color: var(--consider-border); }
  .rm-col-dev .rm-column-header { background: var(--dev-bg); color: var(--dev-text); border-color: var(--dev-border); }
  .rm-col-launched .rm-column-header { background: var(--launched-bg); color: var(--launched-text); border-color: var(--launched-border); }
  .rm-col-dot { width: 7px; height: 7px; border-radius: 50%; flex-shrink: 0; }
  .rm-col-consideration .rm-col-dot { background: var(--consider-text); }
  .rm-col-dev .rm-col-dot { background: var(--dev-text); }
  .rm-col-launched .rm-col-dot { background: var(--launched-text); }
  .rm-column-body { flex: 1; display: flex; flex-direction: column; gap: 8px; padding: 10px; background: var(--bg-subtle); border-radius: 0 0 6px 6px; border: 1px solid; border-top: none; min-height: 80px; }
  .rm-col-consideration .rm-column-body { border-color: var(--consider-border); }
  .rm-col-dev .rm-column-body { border-color: var(--dev-border); }
  .rm-col-launched .rm-column-body { border-color: var(--launched-border); }

  /* Card styles */
  .rm-card { background: var(--bg); border: 1px solid var(--border); border-radius: 6px; font-size: 13px; line-height: 1.55; color: var(--text-secondary); transition: box-shadow 0.15s, border-color 0.15s; overflow: hidden; }
  .rm-card:hover { box-shadow: 0 1px 6px rgba(0,0,0,0.07); border-color: var(--border-strong); }

  /* Card summary row */
  .rm-card-summary { display: flex; align-items: center; gap: 8px; padding: 11px 12px; }
  .rm-card-summary-text { flex: 1; min-width: 0; white-space: normal; font-size: 13px; color: var(--text-secondary); }

  /* Expand button */
  .rm-expand-btn { flex-shrink: 0; display: flex; align-items: center; justify-content: center; width: 22px; height: 22px; border-radius: 4px; border: 1px solid var(--border); background: transparent; cursor: pointer; color: var(--muted); font-size: 11px; transition: background 0.12s, border-color 0.12s, color 0.12s; }
  .rm-expand-btn:hover { background: var(--bg-subtle); border-color: var(--border-strong); color: var(--text); }
  .rm-expand-btn svg { transition: transform 0.2s; display: block; }
  .rm-expand-btn.expanded svg { transform: rotate(180deg); }

  /* Expanded detail */
  .rm-card-detail { border-top: 1px solid var(--border); padding: 10px 12px; font-size: 12.5px; color: var(--muted); line-height: 1.6; display: none; }
  .rm-card-detail.open { display: block; }
  .rm-card-detail ul { margin-top: 6px; padding-left: 16px; }
  .rm-card-detail ul li { margin-top: 3px; }

  /* Tags */
  .rm-card-tags { margin-top: 8px; display: flex; gap: 6px; flex-wrap: wrap; align-items: center; }
  .rm-tag { display: inline-flex; align-items: center; gap: 4px; padding: 2px 8px; border-radius: 4px; font-size: 11px; font-weight: 600; letter-spacing: 0.03em; border: 1px solid; }
  .rm-tag-Mar { background: var(--mar-bg); color: var(--mar-text); border-color: var(--mar-border); }
  .rm-tag-Apr { background: var(--apr-bg); color: var(--apr-text); border-color: var(--apr-border); }
  .rm-tag-May { background: var(--may-bg); color: var(--may-text); border-color: var(--may-border); }
  .rm-tag-Jun { background: var(--jun-bg); color: var(--jun-text); border-color: var(--jun-border); }
  .rm-tag-TBD { background: var(--tbd-bg); color: var(--tbd-text); border-color: var(--tbd-border); }
  .rm-tag-live { background: var(--launched-bg); color: var(--launched-text); border-color: var(--launched-border); }

  .rm-card-placeholder { background: transparent; border: 1px dashed var(--border-strong); border-radius: 6px; padding: 12px 14px; font-size: 12.5px; color: var(--muted-light); font-style: italic; }
  .rm-section { display: none; }
  .rm-section.active { display: block; }
  .rm-footnotes { margin-top: 20px; padding-top: 14px; border-top: 1px solid var(--border); display: flex; flex-direction: column; gap: 6px; }
  .rm-footnote { font-size: 12px; color: var(--muted); line-height: 1.5; }
  .rm-footnote sup { font-size: 9px; margin-right: 3px; font-weight: 600; }
</style>

<script>
// ============================================================
// ✏️  EDIT YOUR ROADMAP HERE — nothing below needs to change
// ============================================================
//
// HOW TO ADD A CARD:
//   Each card is an object with a "short" (one-line summary) and a "detail" (expanded description).
//
//     { short: "Your one-liner here", detail: "Fuller explanation shown on expand." },
//
// HOW TO ADD A DEVELOPMENT CARD WITH A MONTH TAG:
//     { short: "Your one-liner", detail: "Fuller explanation.", month: "Apr" },
//   Valid months: "Mar" "Apr" "May" "Jun" "TBD"
//
// HOW TO ADD SUB-POINTS to any card (optional):
//     { short: "Main item", detail: "Fuller explanation.", month: "Mar", points: ["Sub point 1", "Sub point 2"] },
//
// HOW TO REMOVE A CARD:
//   Delete that object (including the comma at the end)
//
// HOW TO MOVE A CARD (e.g. from development → launched):
//   Cut the object from one section, paste into the other.
//   For launched cards, remove the month property — just keep short and detail.
//
// ============================================================

const ROADMAP = {

  // ----------------------------------------------------------
  // SECTION 1: ONBOARDING
  // ----------------------------------------------------------
  onboarding: {

    consideration: [
      {
        short: "Aadhaar e-KYC to skip Digilocker redirections",
        detail: "Aadhaar-based e-KYC would let investors complete identity verification inline, eliminating the need for Digilocker redirections and the friction they introduce."
      },
    ],

    development: [
      {
        short: "Silent bank account verification via Penniless BAV",
        detail: "Bank account will be done silently in the background (as compared to pennydrop), thereby providing a better investor onboarding experience.",
        month: "May"
      },
      {
        short: "Status visibility for a new KYC submission",
        detail: "Distributors will be able to see the status of KYC request applications for non-compliant investors. They will be notified when the investor is ready to invest.",
        month: "May"
      },
    ],

    launched: [
      {
        short: "Integration with KFintech KRA for KYC",
        detail: "KFin KRA will act as a back up, ensuring onboardings are not blocked in case CVL is down.",
        month: "Apr"
      },
      {
        short: "Better BAV confidence score calculations",
        detail: "Optimisations to the algorithm that determines bank account verification confidence scores, improving accuracy and reducing false negatives.",
        month: "Apr"
      },
      {
        short: "Simplified Digilocker flow for investors",
        detail: "Improved the Digilocker experience for two types of cases: investors who don't have a Digilocker account, and those whose Digilocker account isn't linked to Aadhaar. They will be able to complete onboarding within the distributor app itself."
      },
      {
        short: "BAV p95 latency down from ~12s to ~4s",
        detail: "95% of BAV requests are now completed within 4 seconds or less."
      },
      {
        short: "KYC modification support",
        detail: "Investors whose KYC status is validated, registered/verified, or on hold, can now modify and complete their KYC. This ensures fewer drop offs during onboarding."
      },
    ],

  },

  // ----------------------------------------------------------
  // SECTION 2: ORDERS
  // ----------------------------------------------------------
  orders: {

    consideration: [
      {
        short: "Orders against existing corporate folios",
        detail: "Corporate investors will be able to place orders against their existing folios through FP-ONDC"
      },
      {
        short: "Weekly SIP frequency",
        detail: "Enable investors to set up SIPs with a weekly deduction frequency, in addition to the existing monthly and fortnightly options."
      },
    ],

    development: [
      {
        short: "Switch by units, amount, or switch all",
        detail: "Investors will be able to initiate switch transactions specifying the number of units, a rupee amount, or choosing to switch the entire holding — giving full flexibility in how switches are placed.",
        month: "May"
      },
      {
        short: "Universal instant redemption for ONDC API",
        detail: "Distributors using the FP-ONDC API can offer instant redemption to investors without needing individual tie-ups with each AMC. We will initially going live ",
        month: "May"
      },
      {
        short: "Multi-gateway support within a single tenant",
        detail: "RTA customers will be able to place orders through both the ONDC gateway and the RTA gateway within the same tenant, without needing separate integrations.",
        month: "May"
      },
    ],

    launched: [
      {
        short: "Skip or pause an active SIP",
        detail: "Investors will be able to skip SIP instalments without cancelling the mandate or SIP. The skip instalment feature can be used programmatically to pause an SIP",
      },
      {
        short: "Capital gains report",
        detail: "Generate capital gains reports for investors.",
      },
      {
        short: "Orders against folios created outside ONDC",
        detail: "Distributors can now place orders against folios that were created outside the ONDC platform, removing the prior restriction that required folios to originate within ONDC."
      },
      {
        short: "Distributors can collect lumpsum payment directly",
        detail: "Distributors now have the ability to collect payment from investors on their own for lumpsum purchases, without relying on platform-generated payment links."
      },
    ],

  },

  // ----------------------------------------------------------
  // SECTION 3: PAYMENTS
  // ----------------------------------------------------------
  payments: {

    consideration: [
      {
        short: "Mandate auth + first payment in one step",
        detail: "A unified flow that lets investors authorise an autopay mandate and make the first instalment payment in the same instance."
      },
      {
        short: "Ability to cancel mandates",
        detail: "Allow investors or distributors to cancel existing autopay mandates directly through the platform."
      },
      {
        short: "Same-day settlement for batch purchases and SIPs",
        detail: "Batch lumpsum purchases and SIP instalments will settle on the same day for select AMCs.",
      },
    ],

    development: [
      {
        short: "Token URL UX redesign",
        detail: "A redesigned payment token URL experience, especially aimed at new MF distributors building their first investor-facing app — cleaner layout, clearer calls to action, and a better mobile experience.",
        month: "May"
      },
    ],

    launched: [
      {
        short: "Payment failure window cut from T+7 days to T+30 min",
        detail: "Failed payments will be flagged within 30 minutes instead of the current T+7 day window, enabling investors to retry much faster and reducing the risk of missing NAV-sensitive transactions.",
        month: "Apr"
      },
      {
        short: "Mandate against lumpsum purchases",
        detail: "Use case: For 'first instalment today' SIPs, investors will be able to authorise an autopay mandate and initiate the first instalment payment in a single UPI interaction. The first instalment will be debited within 24–28 hours of mandate authorisation."
      },
      {
        short: "Manual retry for failed lumpsum and SIP payments",
        detail: "Payments can now be retried manually for an existing order. The investor will not have to place a fresh order just to retry a payment."
      },
      {
        short: "Auto-retry for failed mandate-based SIP payments",
        detail: "SIP payments that fail due to technical reasons are now automatically retried upto 3 times, reducing instances of missed instalments without investor intervention."
      },
    ],

  },

};

// ============================================================
// LAST UPDATED DATE — change this whenever you edit the roadmap
// ============================================================
const LAST_UPDATED = "1st June, 2026";

// ============================================================
// ⛔ DO NOT EDIT ANYTHING BELOW THIS LINE
// ============================================================

document.addEventListener("DOMContentLoaded", () => {
  const sections = Object.keys(ROADMAP);

  const tabsEl = document.getElementById("rm-tabs");
  sections.forEach((section, i) => {
    const data = ROADMAP[section];
    const total = data.consideration.length + data.development.length + data.launched.length;
    const btn = document.createElement("button");
    btn.className = "rm-tab" + (i === 0 ? " active" : "");
    btn.innerHTML = `${cap(section)} <span class="rm-count">${total || "—"}</span>`;
    btn.onclick = () => showSection(section, btn);
    tabsEl.appendChild(btn);
  });

  const container = document.getElementById("rm-sections");
  sections.forEach((section, i) => {
    const data = ROADMAP[section];
    const div = document.createElement("div");
    div.className = "rm-section" + (i === 0 ? " active" : "");
    div.id = "rm-section-" + section;
    div.innerHTML = `
      <div class="rm-board">
        <div class="rm-column rm-col-consideration">
          <div class="rm-column-header"><span class="rm-col-dot"></span> Under Consideration <sup style="font-size:9px;margin-left:1px;font-weight:700;">*</sup></div>
          <div class="rm-column-body">${renderCards(data.consideration, "consideration")}</div>
        </div>
        <div class="rm-column rm-col-dev">
          <div class="rm-column-header"><span class="rm-col-dot"></span> Under Development <sup style="font-size:9px;margin-left:1px;font-weight:700;">**</sup></div>
          <div class="rm-column-body">${renderCards(data.development, "dev")}</div>
        </div>
        <div class="rm-column rm-col-launched">
          <div class="rm-column-header"><span class="rm-col-dot"></span> Launched</div>
          <div class="rm-column-body">${renderCards(data.launched, "launched")}</div>
        </div>
      </div>
      <div class="rm-footnotes">
        <div class="rm-footnote"><sup>*</sup> Items under consideration are candidates for development and may be deferred or dropped due to changes in priorities, capacity, or dependencies.</div>
        <div class="rm-footnote"><sup>**</sup> Month tags indicate estimated launch dates and are subject to change.</div>
      </div>`;
    container.appendChild(div);
  });

  document.getElementById("rm-last-updated").textContent = LAST_UPDATED;

  document.addEventListener("click", e => {
    const btn = e.target.closest(".rm-expand-btn");
    if (!btn) return;
    const card = btn.closest(".rm-card");
    const detail = card.querySelector(".rm-card-detail");
    const isOpen = detail.classList.toggle("open");
    btn.classList.toggle("expanded", isOpen);
  });
});

function chevronSVG() {
  return `<svg width="10" height="10" viewBox="0 0 10 10" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M2 3.5L5 6.5L8 3.5" stroke="currentColor" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round"/></svg>`;
}

function renderCards(items, type) {
  if (!items || !items.length) return `<div class="rm-card-placeholder">No items yet</div>`;
  return items.map(item => {
    const short = typeof item === "string" ? item : item.short;
    const detail = typeof item === "string" ? "" : item.detail;
    const month = item.month || null;
    const points = item.points || [];
    const isLive = type === "launched";

    const tagsHTML = (() => {
      const tags = [];
      if (month) tags.push(`<span class="rm-tag rm-tag-${month}">📅 ${month} 2026</span>`);
      if (isLive) tags.push(`<span class="rm-tag rm-tag-live">✓ Live</span>`);
      return tags.length ? `<div class="rm-card-tags">${tags.join("")}</div>` : "";
    })();

    const pointsHTML = points.length
      ? `<ul>${points.map(p => `<li>${p}</li>`).join("")}</ul>`
      : "";

    const detailContent = [detail, pointsHTML].filter(Boolean).join("");
    const detailHTML = detailContent
      ? `<div class="rm-card-detail">${detailContent}${tagsHTML ? `<div style="margin-top:8px;">${tagsHTML}</div>` : ""}</div>`
      : (tagsHTML ? `<div class="rm-card-detail">${tagsHTML}</div>` : "");

    const hasExpandable = !!detailContent || !!tagsHTML;

    return `<div class="rm-card">
      <div class="rm-card-summary">
        <span class="rm-card-summary-text" title="${escAttr(short)}">${short}</span>
        ${hasExpandable ? `<button class="rm-expand-btn" aria-label="Expand">${chevronSVG()}</button>` : ""}
      </div>
      ${detailHTML}
    </div>`;
  }).join("");
}

function showSection(id, el) {
  document.querySelectorAll(".rm-section").forEach(s => s.classList.remove("active"));
  document.querySelectorAll(".rm-tab").forEach(t => t.classList.remove("active"));
  document.getElementById("rm-section-" + id).classList.add("active");
  el.classList.add("active");
}

function cap(str) { return str.charAt(0).toUpperCase() + str.slice(1); }
function escAttr(str) { return str.replace(/"/g, "&quot;"); }
</script>

<div class="rm-wrap">
  <div class="rm-header">
    <div class="rm-title">Product Roadmap</div>
    <div class="rm-subtitle">Last updated <span id="rm-last-updated"></span></div>
  </div>
  <div class="rm-tabs" id="rm-tabs"></div>
  <div id="rm-sections"></div>
</div>