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
  .rm-card { background: var(--bg); border: 1px solid var(--border); border-radius: 6px; padding: 12px 14px; font-size: 13px; line-height: 1.55; color: var(--text-secondary); transition: box-shadow 0.15s, border-color 0.15s; }
  .rm-card:hover { box-shadow: 0 1px 6px rgba(0,0,0,0.07); border-color: var(--border-strong); }
  .rm-card-tags { margin-top: 9px; display: flex; gap: 6px; flex-wrap: wrap; align-items: center; }
  .rm-tag { display: inline-flex; align-items: center; gap: 4px; padding: 2px 8px; border-radius: 4px; font-size: 11px; font-weight: 600; letter-spacing: 0.03em; border: 1px solid; }
  .rm-tag-Mar { background: var(--mar-bg); color: var(--mar-text); border-color: var(--mar-border); }
  .rm-tag-Apr { background: var(--apr-bg); color: var(--apr-text); border-color: var(--apr-border); }
  .rm-tag-May { background: var(--may-bg); color: var(--may-text); border-color: var(--may-border); }
  .rm-tag-Jun { background: var(--jun-bg); color: var(--jun-text); border-color: var(--jun-border); }
  .rm-tag-TBD { background: var(--tbd-bg); color: var(--tbd-text); border-color: var(--tbd-border); }
  .rm-tag-live { background: var(--launched-bg); color: var(--launched-text); border-color: var(--launched-border); }
  .rm-sub-list { margin-top: 6px; padding-left: 16px; font-size: 12.5px; color: var(--muted); }
  .rm-sub-list li { margin-top: 3px; }
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
//   Under "consideration" or "launched" — just add a new line:
//     "Your item text here",
//
// HOW TO ADD A DEVELOPMENT CARD WITH A MONTH TAG:
//     { text: "Your item text here", month: "Apr" },
//   Valid months: "Mar" "Apr" "May" "Jun" "TBD"
//
// HOW TO ADD SUB-POINTS to any card (optional):
//     { text: "Main item text", month: "Mar", points: ["Sub point 1", "Sub point 2"] },
//
// HOW TO REMOVE A CARD:
//   Delete that line (including the comma at the end)
//
// HOW TO MOVE A CARD (e.g. from development → launched):
//   Cut the line from one section, paste into the other.
//   For launched cards, remove the { } and month — just use "plain text",
//
// ============================================================

const ROADMAP = {

  // ----------------------------------------------------------
  // SECTION 1: ONBOARDING
  // ----------------------------------------------------------
  onboarding: {

    consideration: [
      "Penniless and PAN-based methods for silent bank account verification",
      "Aadhaar based e-KYC — eliminates the need for Digilocker redirections",
    ],

    development: [
      {
        text: "Simplified Digilocker flow for investors",
        month: "Mar",
        points: [
          "Without a Digilocker account",
          "Digilocker account not linked to Aadhaar",
        ]
      },
      { text: "Optimisations in BAV confidence score calculations", month: "Mar" },
    ],

    launched: [
      "BAV p95 latency improved from ~12s to ~4s",
      "KYC modification",
    ],

  },

  // ----------------------------------------------------------
  // SECTION 2: ORDERS
  // ----------------------------------------------------------
  orders: {

    consideration: [
      "Orders against existing corporate folios",
      "Universal instant redemption integration — Distributors can use FP-ONDC API without tying up with AMCs to integrate instant redemption",
      "Multigateway support for tenants — RTA customers can place orders through both ONDC and RTA gateway within the same tenant",
      "Skip / Pause SIP",
      "Weekly SIP",
      "Capital gains report",
    ],

    development: [
      { text: "Switch by units, amount and switch all", month: "Mar" },
      { text: "Mandate against single lumpsum purchases — for 'first instalment today' SIPs, investors will authorise an autopay mandate and make the first instalment payment in a single UPI interaction. The first instalment will be debited within 24–28 hours.", month: "Mar" },
    ],

    launched: [
      "Orders against folios created outside ONDC",
      "Ability for distributors to collect payment on their own for lumpsum purchases",
    ],

  },

  // ----------------------------------------------------------
  // SECTION 3: PAYMENTS
  // ----------------------------------------------------------
  payments: {

    consideration: [
      "Mandate authorisation and first payment in a single instance",
      "Ability to cancel mandates",
    ],

    development: [
      { text: "Same day settlement for batch lumpsum purchases and SIPs (initially available for select AMCs)", month: "Mar" },
      { text: "Reduced time for payment failure from T+7 days to T+30 minutes — enables quicker payment retry", month: "Mar" },
      { text: "Token URL UX redesign for a better investor experience — especially helpful for new MF distributors building a new app", month: "Mar" },
      { text: "Mandate against single lumpsum purchases — for 'first instalment today' SIPs, investors will be able to authorise an autopay mandate and make the first instalment payment in a single UPI interaction. The first instalment will be debited within 24–28 hours.", month: "Mar" },
    ],

    launched: [
      "Manual payment retry for failed payments against lumpsum orders and SIP instalments",
      "Automatic retry for failed mandate-based payments — SIP payments that failed due to technical reasons are now automatically retried",
    ],

  },

};

// ============================================================
// LAST UPDATED DATE — change this whenever you edit the roadmap
// ============================================================
const LAST_UPDATED = "3rd Mar, 2026";

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
          <div class="rm-column-body">${renderConsideration(data.consideration)}</div>
        </div>
        <div class="rm-column rm-col-dev">
          <div class="rm-column-header"><span class="rm-col-dot"></span> Under Development <sup style="font-size:9px;margin-left:1px;font-weight:700;">**</sup></div>
          <div class="rm-column-body">${renderDevelopment(data.development)}</div>
        </div>
        <div class="rm-column rm-col-launched">
          <div class="rm-column-header"><span class="rm-col-dot"></span> Launched</div>
          <div class="rm-column-body">${renderLaunched(data.launched)}</div>
        </div>
      </div>
      <div class="rm-footnotes">
        <div class="rm-footnote"><sup>*</sup> Items under consideration are candidates for development and may be deferred or dropped due to changes in priorities, capacity, or dependencies.</div>
        <div class="rm-footnote"><sup>**</sup> Month tags indicate estimated launch dates and are subject to change.</div>
      </div>`;
    container.appendChild(div);
  });

  document.getElementById("rm-last-updated").textContent = LAST_UPDATED;
});

function renderConsideration(items) {
  if (!items.length) return `<div class="rm-card-placeholder">No items yet</div>`;
  return items.map(i => `<div class="rm-card">${i}</div>`).join("");
}

function renderDevelopment(items) {
  if (!items.length) return `<div class="rm-card-placeholder">No items yet</div>`;
  return items.map(item => {
    const points = item.points ? `<ul class="rm-sub-list">${item.points.map(p => `<li>${p}</li>`).join("")}</ul>` : "";
    const tag = item.month ? `<div class="rm-card-tags"><span class="rm-tag rm-tag-${item.month}">📅 ${item.month} 2026</span></div>` : "";
    return `<div class="rm-card">${item.text}${points}${tag}</div>`;
  }).join("");
}

function renderLaunched(items) {
  if (!items.length) return `<div class="rm-card-placeholder">No items yet</div>`;
  return items.map(i => `<div class="rm-card">${i}<div class="rm-card-tags"><span class="rm-tag rm-tag-live">✓ Live</span></div></div>`).join("");
}

function showSection(id, el) {
  document.querySelectorAll(".rm-section").forEach(s => s.classList.remove("active"));
  document.querySelectorAll(".rm-tab").forEach(t => t.classList.remove("active"));
  document.getElementById("rm-section-" + id).classList.add("active");
  el.classList.add("active");
}

function cap(str) { return str.charAt(0).toUpperCase() + str.slice(1); }
</script>

<div class="rm-wrap">

  <div class="rm-header">
    <div class="rm-title">Product Roadmap</div>
    <div class="rm-subtitle">Last updated <span id="rm-last-updated"></span></div>
  </div>

  <div class="rm-tabs" id="rm-tabs"></div>
  <div id="rm-sections"></div>

</div>